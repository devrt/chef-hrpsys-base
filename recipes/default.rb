#
# Cookbook Name:: hrpsys-base
# Recipe:: default
#
# Copyright 2014, Yosuke Matsusaka
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"
include_recipe "python"
include_recipe "subversion::client"
include_recipe "omniorb"
include_recipe "collada-dom"
include_recipe "openrtm-aist"
include_recipe "openhrp"

pkgs = value_for_platform_family(
  ["debian"] => %w{libqhull-dev libirrlicht-dev libsdl1.2-dev freeglut3-dev libxmu-dev libglew-dev libopencv-dev libgtest-dev libboost-python-dev ipython python-tk}
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

bash "compile_hrpsys-base" do
  cwd "#{Chef::Config['file_cache_path']}/hrpsys-base"
  code <<-EOH
      ln -s /usr/include/opencv2 /usr/include/opencv
      ln -s /usr/include/opencv2/opencv.hpp /usr/include/opencv/cv.h
      ln -s /usr/include/opencv2/highgui/highgui.hpp /usr/include/opencv/highgui.h
      cmake . -DCOMPILE_JAVA_STUFF=OFF -DENABLE_DOXYGEN=OFF
      make clean && make && make install
      ldconfig
  EOH
  action :nothing
end

subversion "hrpsys-base" do
  repository "http://hrpsys-base.googlecode.com/svn/trunk/"
  revision "HEAD"
  destination "#{Chef::Config[:file_cache_path]}/hrpsys-base"
  action :sync
  notifies :run, "bash[compile_hrpsys-base]", :immediately
end
