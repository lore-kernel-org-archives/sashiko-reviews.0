Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514195;
	b=M3o+QEXJyuA83yS4HPbJ3UszyB1ULxOlvoiPMmiGOpXTLkSiSJpNgTOfubby5i28eCRR
	 dXCVrWUOPuvykNDNJSgTbENXzwPjGM0C+oRtEcdU2mKpZZBC3JTEgTjkI2EbkCXJ4BfB2
	 LfKMDA0dPkZMYPbDhCpHaXdFiuswiQBJjiWziXOlEaHHBR5OoZPIcwTnly6+/dBDaSgTr
	 is/BvYkhHAoBPfveJs8S41jfyGIf7eQEvgYxqNwo7fXRgOACLY/fvAoeAh/jiao4Otnh9
	 x9NiYp9n7ZoloXtDgrILRzO/Mvdw1SeAORsVRzM+IkLrU4k5Lin1CQhp+MVn6QqLnjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514195;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8L8kC9u4P2bhXSG9aS8f2aG6Mk5zc5krKHneokhV9uw=;
	b=UJnp1wmEZX+f2MqBlqxjYprLNLQzjt5B2Equ0h7nlvIk50+et8go5U+XWxAGg4MlwN6L
	 xZVZXuPM7XpzADo/l87nWgnQ+j6E2/tXTY62jAQ6ACXWXo3JLbdaYYPsPiWRINRnuGuf9
	 W9IF4XbYotcW10avucV3emM92WNp70wOwPfFExnN0snQGKGHOUyRWXsjwEwSMropaDHYW
	 TqRI06HiQQFuTuAoTC+AnR4HKMKqYfaBU4vTD9fnzsGApHyVyWDjR0b4m1vQXMfLCCbZV
	 0DnZxx3nOC8q0xHteiB8YbVkjUz5S1Lt9M1zoC6t3LtAEqN3/ZUxsC1moLhCbA22n4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzNtIYQH;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAF606A31C;
	Thu, 12 Nov 2026 20:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzNtIYQH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794514195; x=1826050195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0Jmt3RGWgn8b3wNzBOG3FMike2nuQx+tirONUWZoXQ=;
  b=VzNtIYQHwlz1Y6NVnRqUzQw0z/UVmyprT13N2MQ3wBbUzFufbeyT5WAB
   ptdpx8dGS1YxDQf5UxKj8GqbjHk0JK3J4tfYIprApWjn4NUKIKB1A6SrK
   3M01PFEwM1uPQOqdL8meoTHHuTMiI/MWZ72HFwPtfMO3h3i/8uUmAkQgl
   wq34Fb6ek8tawZ8tWT9wCOTQwEpbgryTgamJ2URTPtGZsMcgmY3JR495e
   VM/D4fTbJ9L1sd9GY7DEm9e4hQQNz7wZFTofTLrKYwl7YLAjoBnthRUtS
   fDPiq+MFN+Pq3jdWy3NUIQwmfVxCnV8H0PUyGRlKZkfIYGkYxhGYxwGqb
   A==;
X-CSE-ConnectionGUID: BKxY8+SwQxOleIbkbeoKcQ==
X-CSE-MsgGUID: wVW9iJefQ263UDmrZzpoyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3315824"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3315824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:09:55 -0800
X-CSE-ConnectionGUID: XJP+f/0XSauhbTSsG5X+HQ==
X-CSE-MsgGUID: YAaFgH0hQYKPDDCj9imqfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9074008"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2026 12:09:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRb7E-000000011zv-3F9X;
	Thu, 12 Nov 2026 20:09:48 +0000
Date: Fri, 13 Nov 2026 04:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm: Remove drm_crtc_init()
Message-ID: <202611130335.vCIEnRqF-lkp@intel.com>
References: <20261112125039.66082-3-tzimmermann@suse.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112125039.66082-3-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-radeon-Inline-drm_crtc_init/20261112-134508
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261112125039.66082-3-tzimmermann%40suse.de
patch subject: [PATCH v2 2/2] drm: Remove drm_crtc_init()
config: arc-randconfig-1001-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130335.vCIEnRqF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130335.vCIEnRqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130335.vCIEnRqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c: In function 'dce_v10_0_crtc_init':
>> drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:2677:9: error: implicit declaration of function 'drm_crtc_init'; did you mean 'drm_exec_init'? [-Werror=implicit-function-declaration]
    2677 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v10_0_crtc_funcs);
         |         ^~~~~~~~~~~~~
         |         drm_exec_init
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c: In function 'dce_v8_0_crtc_init':
>> drivers/gpu/drm/amd/amdgpu/dce_v8_0.c:2603:9: error: implicit declaration of function 'drm_crtc_init'; did you mean 'drm_exec_init'? [-Werror=implicit-function-declaration]
    2603 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v8_0_crtc_funcs);
         |         ^~~~~~~~~~~~~
         |         drm_exec_init
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c: In function 'dce_v6_0_crtc_init':
>> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:2645:9: error: implicit declaration of function 'drm_crtc_init'; did you mean 'drm_exec_init'? [-Werror=implicit-function-declaration]
    2645 |         drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v6_0_crtc_funcs);
         |         ^~~~~~~~~~~~~
         |         drm_exec_init
   cc1: some warnings being treated as errors


vim +2677 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c

7e50642d41050c Alex Deucher 2024-10-31  2667  
aaa36a976bbb9b Alex Deucher 2015-04-20  2668  static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
aaa36a976bbb9b Alex Deucher 2015-04-20  2669  {
aaa36a976bbb9b Alex Deucher 2015-04-20  2670  	struct amdgpu_crtc *amdgpu_crtc;
aaa36a976bbb9b Alex Deucher 2015-04-20  2671  
aaa36a976bbb9b Alex Deucher 2015-04-20  2672  	amdgpu_crtc = kzalloc(sizeof(struct amdgpu_crtc) +
aaa36a976bbb9b Alex Deucher 2015-04-20  2673  			      (AMDGPUFB_CONN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
aaa36a976bbb9b Alex Deucher 2015-04-20  2674  	if (amdgpu_crtc == NULL)
aaa36a976bbb9b Alex Deucher 2015-04-20  2675  		return -ENOMEM;
aaa36a976bbb9b Alex Deucher 2015-04-20  2676  
4a580877bdcb83 Luben Tuikov 2020-08-24 @2677  	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v10_0_crtc_funcs);
aaa36a976bbb9b Alex Deucher 2015-04-20  2678  
aaa36a976bbb9b Alex Deucher 2015-04-20  2679  	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
aaa36a976bbb9b Alex Deucher 2015-04-20  2680  	amdgpu_crtc->crtc_id = index;
aaa36a976bbb9b Alex Deucher 2015-04-20  2681  	adev->mode_info.crtcs[index] = amdgpu_crtc;
aaa36a976bbb9b Alex Deucher 2015-04-20  2682  
aaa36a976bbb9b Alex Deucher 2015-04-20  2683  	amdgpu_crtc->max_cursor_width = 128;
aaa36a976bbb9b Alex Deucher 2015-04-20  2684  	amdgpu_crtc->max_cursor_height = 128;
4a580877bdcb83 Luben Tuikov 2020-08-24  2685  	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
4a580877bdcb83 Luben Tuikov 2020-08-24  2686  	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
aaa36a976bbb9b Alex Deucher 2015-04-20  2687  
aaa36a976bbb9b Alex Deucher 2015-04-20  2688  	switch (amdgpu_crtc->crtc_id) {
aaa36a976bbb9b Alex Deucher 2015-04-20  2689  	case 0:
aaa36a976bbb9b Alex Deucher 2015-04-20  2690  	default:
aaa36a976bbb9b Alex Deucher 2015-04-20  2691  		amdgpu_crtc->crtc_offset = CRTC0_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2692  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2693  	case 1:
aaa36a976bbb9b Alex Deucher 2015-04-20  2694  		amdgpu_crtc->crtc_offset = CRTC1_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2695  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2696  	case 2:
aaa36a976bbb9b Alex Deucher 2015-04-20  2697  		amdgpu_crtc->crtc_offset = CRTC2_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2698  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2699  	case 3:
aaa36a976bbb9b Alex Deucher 2015-04-20  2700  		amdgpu_crtc->crtc_offset = CRTC3_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2701  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2702  	case 4:
aaa36a976bbb9b Alex Deucher 2015-04-20  2703  		amdgpu_crtc->crtc_offset = CRTC4_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2704  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2705  	case 5:
aaa36a976bbb9b Alex Deucher 2015-04-20  2706  		amdgpu_crtc->crtc_offset = CRTC5_REGISTER_OFFSET;
aaa36a976bbb9b Alex Deucher 2015-04-20  2707  		break;
aaa36a976bbb9b Alex Deucher 2015-04-20  2708  	}
aaa36a976bbb9b Alex Deucher 2015-04-20  2709  
aaa36a976bbb9b Alex Deucher 2015-04-20  2710  	amdgpu_crtc->pll_id = ATOM_PPLL_INVALID;
aaa36a976bbb9b Alex Deucher 2015-04-20  2711  	amdgpu_crtc->adjusted_clock = 0;
aaa36a976bbb9b Alex Deucher 2015-04-20  2712  	amdgpu_crtc->encoder = NULL;
aaa36a976bbb9b Alex Deucher 2015-04-20  2713  	amdgpu_crtc->connector = NULL;
aaa36a976bbb9b Alex Deucher 2015-04-20  2714  	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v10_0_crtc_helper_funcs);
7e50642d41050c Alex Deucher 2024-10-31  2715  	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v10_0_drm_primary_plane_helper_funcs);
aaa36a976bbb9b Alex Deucher 2015-04-20  2716  
aaa36a976bbb9b Alex Deucher 2015-04-20  2717  	return 0;
aaa36a976bbb9b Alex Deucher 2015-04-20  2718  }
aaa36a976bbb9b Alex Deucher 2015-04-20  2719  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
