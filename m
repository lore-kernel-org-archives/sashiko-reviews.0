Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471666;
	b=1nipUSN72flyRTyZWdSA3y9L+1GWZDurLdSykWdpLvd57++7GgGzXA0CkjCksNPWlS1g
	 0IFObh/egYcLxj/eh7TQ160zPAm9GyA307MMQaCcQ/Yz5/0GjIVvRHkXlIbqa8XXkbrou
	 l+ReiARGVRvHck/bdzajxASnCfpKxHzjADdtas8kcYLId7I1ey9ln1QS9GqLk0iAvYK/0
	 QPrhUFpKRFXNkniulQN9KwemoZBj7j4Z3FTWauyDoOUSqlYuQ3St9FWeAtwkvwsdBtlWH
	 DUuuymKeEkPHYKbUDvaeZKjL/KPyblQzM2x9XRuInn+jF1//zPs4VlqSD1QQFuBsztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471666;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kz6lD1+XBXfHjqQKyyXDM3HMrZnJ8JeZYEDjfJgGXE8=;
	b=I3cmfvbNuqnXQZHk1BvxVVA+6Vnjjux/WW31a/cuv7TCniSUgEM9Dxo5g92r9fPEM71u
	 cCU2oz2I5bYDHxEo0DMQFP0Si35ehxhr5VEqCXKvYjb9MjQsgypvcsBy15/j63KmuCy2M
	 L686RBJ669C8ZPSqmc6E6hRdxj9WAZ704lhMcVHgeUAemouCwr64iglRHOR+QR4rCpy6W
	 RFq13tvVmD5b78CUf7A6DXiJW9JNBRm7wXXp9OevlQy9tDBlnApuI1Q7j4mv35EfL6uGz
	 NvZyfhJVbF7r4ULL7I4cS2jbbfU8C3NjiOSEH2VFWdvJYrhX7xlrdo0dZQvVr5M8lCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="F8kHAEQ/";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5C606A8B3
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 08:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B5C606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8kHAEQ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794471665; x=1826007665;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+fzIY9VHO8HIK6IBpVJ8SrhPU5TbO8gdIyrgfH2KlGI=;
  b=F8kHAEQ/1QcNGVJ2VuszCORcqgMwuHY1HMhSZxeMtXgRamX0J9d8QP6D
   MIE/knUou4xBW2bX0fqFTqfANBClznKjHnFM9J1QAUnkWdawH0NNoPqP4
   bp8bad4dK0J24Q7YdMeFp/G8flGtNE8KxdjCLl1NBljByx9uyCGiLcaLR
   iO7n9Bs2z1UBerb2+es/ynu4WN78FlDHeVHOZu/CKbQbCBzYgatdnzPkL
   DgdY3Z1ahipEkAFGR3OFAg4jt/0UuD4PWsqWNvt02ujJPXNPdCWfo+Cqc
   eG7tJaWYlIHB6P9465ezdmBx6wVHfBD9G1M1ReMCFeZEWaaMqENHFx0mN
   Q==;
X-CSE-ConnectionGUID: yzu8CnAHRKCTijxhoqMM1A==
X-CSE-MsgGUID: 0a1zldnHQPmEaVI/0wdipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3133084"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3133084"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 00:21:05 -0800
X-CSE-ConnectionGUID: iGZ4/1RATNqzsSKTipVUWQ==
X-CSE-MsgGUID: gdZ/lV5fSSaSaMP4GL369Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8691572"
Received: from kngiex-mobl.gar.corp.intel.com (HELO [10.247.254.121]) ([10.247.254.121])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 00:21:03 -0800
Message-ID: <aa5d6f6a-c6ff-4ea7-8b66-8927621c011b@intel.com>
Date: Thu, 12 Nov 2026 13:50:52 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/cri: Add new PCI IDs
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261111055020.866766-1-ranu.maurya@intel.com>
 <sashiko-outbox-208375@kernel.org>
Content-Language: en-US
From: "Maurya, Ranu" <ranu.maurya@intel.com>
In-Reply-To: <sashiko-outbox-208375@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/2026 11:30 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/cper: missing xe_device_guids entries for new CRI PCI
>    IDs
> --
>
> commit 61a3e0e92a66a1e015400ed3ae42a758a161459f
> Author: Ranu Maurya <ranu.maurya@intel.com>
>
> drm/xe/cri: Add new PCI IDs
>
> This commit adds four new Crescent Island (CRI) PCI device IDs (0x6753,
> 0x6754, 0x6755, and 0x6756) to INTEL_CRI_IDS.
>
>> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> index ac858ed26df2e..ab02bef262f14 100644
>> --- a/include/drm/intel/pciids.h
>> +++ b/include/drm/intel/pciids.h
>> @@ -906,7 +906,11 @@
>>   	MACRO__(0x674F, ## __VA_ARGS__), \
>>   	MACRO__(0x6750, ## __VA_ARGS__), \
>>   	MACRO__(0x6751, ## __VA_ARGS__), \
>> -	MACRO__(0x6752, ## __VA_ARGS__)
>> +	MACRO__(0x6752, ## __VA_ARGS__), \
>> +	MACRO__(0x6753, ## __VA_ARGS__), \
>> +	MACRO__(0x6754, ## __VA_ARGS__), \
>> +	MACRO__(0x6755, ## __VA_ARGS__), \
>> +	MACRO__(0x6756, ## __VA_ARGS__)
> [Severity: Medium]
> Should xe_device_guids[] in drivers/gpu/drm/xe/xe_cper.c also be updated
> with platform_id GUID entries for 0x6753, 0x6754, 0x6755, and 0x6756?
>
> xe_device_guids[] only lists CRI device IDs 0x674C through 0x6752.  When
> cper_init_record_hdr() calls lookup_device_guid() on a CRI device with one
> of the new PCI IDs, the lookup fails, logs a warning ("CPER: no platform
> GUID for device"), and leaves rhdr->platform_id unset in emitted CPER
> records.

We need updates to GUID, which will be addressed in a new patch.

- Ranu

