Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607314;
	b=e7cCKdIWRK2WNZVRg5raNrRAaqWKTAhyj9FOZwLXfQDWlNhg3GZG9fszW0M8tLVOkAFP
	 LZMkM7cDb1dpwNS45uIiZemXI9V4MVxqjeORB1FLeAiafiwnA7WSgVAQqUtZDZ1JfEMzz
	 poew/RlqArokvSMso+Olr6r6B+YrTID5ZvpUokkegi7I8uiHGZ8h46OCUaAP+qY+5kcpJ
	 JMcAwX7AonSYGQ1JMGtlDtHzIZ5ZKAoO9+ADkC/vIOKGXdlPwtaOeUI1QEtt1uvzIzOTg
	 QYmGmh7M3yDAn3RDne6+cUdb1iYYdzAezkBWVYZh+LTQXx3YdnG5qLlYRDJ0a6/6X+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607314;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=AKj2uIfUWbn3cT9A3TMD/Ml+gMTm1DckZDYuMo0ZI2g=;
	b=H2FZEvDbVKl3+tVeN5WtmiyJln6yIP0nPG612lFJ9tDSjJLj++KSiIZ6tEwK6pHxbjW9
	 rZHihwxfd0MKiWUbDoaNxnzk2IUmESPnJKtjchdWC4cmMh09RDOhyNNcfeLJwV8DWa24S
	 8gEsQ6cLTi8qbQwoziKRenRP+MqNArdi3QQ2OIJQwL1fN4ssbiKHHnx0j4yhayVJb01WS
	 p0m4onHN+RMiWX11Pb4Zq9KX3sw+zh0WZ/h3rFkYRqrg47b3IY43u4hxSeMwAqeXJe0Gd
	 PQ7T9aiEXyb0KBaTgmEuDwxJInVFmtXtd8Wo4J9q+OqeMAwrjR0K1u3Rbh7AxVXKshA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kz4ReoG2;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626E3606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kz4ReoG2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795607314; x=1827143314;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=SlAJNOZ8GH42CB5OxxCuaE69BzuEFOQuIRpLzKBMgPU=;
  b=kz4ReoG2gw+/7v5dq/8sLeaqPiT/2pf+MbhGTOnTaqmoYua+FwByRs1X
   3N8p0u4hXUJSydwRGyuXxzthfnLEUhCKiKGTJjn9yiQTFPi9Pk7x3dnUN
   ZUukRo2+D1A3r+0vCUviOG8/WBAi3jiFS7rEodInNN17ueNEAV1ARvhLJ
   Y34nmlaufamTnUE8G+Wq+7NH19/lMalrzIq65vpsyjwxOE1n7myvltk4J
   dwfW0aVIwzYRwFdg+Gvaj4KTe5PdMh44uACjKkI1UMFeY9GC9Wn/W2Qtk
   2EKIQG1a68tvqYYtVMLdx7ZVVRPGyQitrBpEwytmgIQndi9nxK1JrTFif
   w==;
X-CSE-ConnectionGUID: I+RiEJdBQ7S2tKrcalncbg==
X-CSE-MsgGUID: wwR4RmYNSqiSHjxAzI6qkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4369350"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4369350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:48:33 -0800
X-CSE-ConnectionGUID: 21w86H2gSvm1ifVn+5oXXA==
X-CSE-MsgGUID: AUxD5cJ/QlSA9qpmwx68Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11864946"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:48:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: sashiko-reviews@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
In-Reply-To: <sashiko-outbox-231335@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124141146.1560208-1-jani.nikula@intel.com>
 <sashiko-outbox-231335@kernel.org>
Date: Wed, 25 Nov 2026 13:48:29 +0200
Message-ID: <5c89a1a8b185633112990fa4201c92e8de0740c6@intel.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 24 Nov 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/i915/display: intel_force_bit_banging_write() missed in
>   %sabling cleanup
> --
>
> commit a6f91eb39a4003adc548629cfa79fbc4fb32b5bb
> Author: Jani Nikula <jani.nikula@intel.com>
>
> drm/i915/display: don't be cute about printing enabling/disabling
>
> This commit replaces "%sabling", enable ? "en" : "dis" debug logging
> patterns in i915 display code with str_enable_disable().
>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> index d43c81d362e6c..d68521588d54b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> @@ -1107,9 +1107,8 @@ void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
>>  	mutex_lock(&display->gmbus.mutex);
>>  
>>  	bus->force_bit += force_bit ? 1 : -1;
>> -	drm_dbg_kms(display->drm,
>> -		    "%sabling bit-banging on %s. force bit now %d\n",
>> -		    force_bit ? "en" : "dis", adapter->name,
>> +	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now %d\n",
>> +		    str_enable_disable(force_bit), adapter->name,
>>  		    bus->force_bit);
>>  
>>  	mutex_unlock(&display->gmbus.mutex);
>
> [Severity: Low]
> Should intel_force_bit_banging_write() in this same file also be converted
> to str_enable_disable()?  It logs the identical bit-banging message using
> the old "%sabling" pattern:

Gah, a dupe of that shouldn't have been added in the first place. :/

Deduplication at [1].


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1795607055.git.jani.nikula@intel.com

>
> drivers/gpu/drm/i915/display/intel_gmbus.c:intel_force_bit_banging_write() {
>     ...
> 		drm_dbg_kms(display->drm,
> 			    "%sabling bit-banging on %s. force bit now %d\n",
> 			    force_bit_banging ? "en" : "dis",
> 			    connector->base.ddc->name, force_bit);
>     ...
> }

-- 
Jani Nikula, Intel
