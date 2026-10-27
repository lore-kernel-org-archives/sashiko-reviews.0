Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119753;
	b=SgPJyKUx+DbsTUP/x6io8OymH6HffWvw5sKv992AgsNPenHR2tVP5tKKqWRRNf0f/4yT
	 pZ/AG6J6kDRJD89chjLFTKdNSMXKJ4XjnvZKQxo9iqxjWbVTVMcXnmm11GAc9hIpY70/S
	 uySkPyDxYVGe+1kUkH/gw9T9ErN9O4iQmxZepsIYnvbmbgniHhgs0vhrk3fbup5eQFelT
	 19LvvkkvbdPW73y4zKZJTlFmQyRBGy1eLZWW8tuMncn8Kw3i/A5OS1dOSV8wHvrh7wx7n
	 RuUA04NyMTIVn3DkWyScn7KKZOWrL9V6egZVZ4cl21ypS9vFFWIaNR0KmJxvVaBgx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119753;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4OUESzsYebVWf16mXRDdwGlgfl3oySne7xBRitq1j4c=;
	b=j8xs0qsuR6Nrf2tlijj/ECcoV7IOYrX7FlC4bN0sVjobVmflaWLc+BsqX4ixTBEyMiKB
	 iIo60HGvNp+Ey9I5AFFvVrW+FPvAV3Qwe9agNF3gI/0Xt4wHDfUujv7Aj+6A4fMzGNWf+
	 O8QX7d04/YNAIYUrnHH0ELH+0mIsEWU6MlAS1Zhf2sJRpkT9u/gjgrQFH6hm+EbAtZsXm
	 UIaCDfCblEGwSdykGf63ckDi9w4hejdlVPNtjU15u9q6PyIwcenDCqktNHV/9XsGYpimo
	 /w9rDbCjfiUbZLy2jWoagGbIGXsuhcdTpc+cBkqQu+a/khiOnEHsY4yDr8oYdvUJlHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTX7n8eq;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7A606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 16:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTX7n8eq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793119752; x=1824655752;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=C1TIIaga/k5KmBqCMhtb6stJtqTXJiiwCNIT/1tPjGE=;
  b=iTX7n8eqkHw5/DNqbtRBWNOQHyzq/u/8voip/H/DpZt6iYbRR0jsx5U8
   riU4+IspDMlZ2dCXhLPDvJ8Nmc91ajF5NvEXqd+34mzmTser8RLdD3rPV
   ojzqhxePUUrUxpyMIsCB/gqxEytTAz34OU3ffSiS0KsQ62abbRrP27WlS
   RX0Bw4lSt/Wt0nc31qw4nubom2JEayYDav3FVu5qrZlRRy0HtyzDYK7NA
   XPmPV3s6OxT7ZAMmaHFOPMtF13FYldCf1ehqyESonHW7/tdkifAMAKsFP
   QmHtXql5O6sHXpABUG2907w1Gghjwr40KjHBWZAEc5jK7Aur9QCL424JG
   w==;
X-CSE-ConnectionGUID: k7Iu8PuHTS2zwPmUzkVIbA==
X-CSE-MsgGUID: f0OsPRhWQdyr+qCmU/b8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1707177"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1707177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:49:12 -0700
X-CSE-ConnectionGUID: r20HOsjjRo6v/coL375vKw==
X-CSE-MsgGUID: 729X7xg0SgqW+CPvelzf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4987269"
Received: from nkthomas-mobl.amr.corp.intel.com (HELO [10.245.83.220]) ([10.245.83.220])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:49:12 -0700
Message-ID: <acf8c268-fbb2-42d3-a3c9-7b52f9b9b9e4@linux.intel.com>
Date: Tue, 27 Oct 2026 17:48:58 +0100
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
Subject: Re: [PATCH] accel/ivpu: Read preemption buffer size from boot params
To: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20261026093020.228233-1-andrzej.kacprowski@linux.intel.com>
 <sashiko-outbox-184934@kernel.org>
Content-Language: en-US
From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
In-Reply-To: <sashiko-outbox-184934@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-Oct-26 11:24 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] accel/ivpu: ivpu_preemption_config_parse() rejects zero secondary buffer size
> --
> 
> commit e2bae997f3bdfe346d64fb0ce52874d7284d8b32
> Author: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> accel/ivpu: Read preemption buffer size from boot params
> 
> This commit updates the ivpu driver to read the preemption buffer size from
> the firmware boot parameters after cold boot during device initialization,
> falling back to the sizes in the firmware image header if not reported. It
> also updates the image header parsing logic to use
> preemption_buffer_2_max_size even when it is zero if
> preemption_buffer_1_max_size is set, and updates the firmware boot API header
> to version 3.39.1.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>> index 96f5be23a8673..6607a5da19340 100644
>> --- a/drivers/accel/ivpu/ivpu_fw.c
>> +++ b/drivers/accel/ivpu/ivpu_fw.c
> [ ... ]
>> @@ -160,35 +165,31 @@ ivpu_fw_sched_mode_select(struct ivpu_device *vdev)
>>   static void
>>   ivpu_preemption_config_parse(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr)
>>   {
>> -	struct ivpu_fw_info *fw = vdev->fw;
>>   	u32 primary_preempt_buf_size, secondary_preempt_buf_size;
>>   
>> -	if (fw_hdr->preemption_buffer_1_max_size)
>> +	if (fw_hdr->preemption_buffer_1_max_size) {
>>   		primary_preempt_buf_size = fw_hdr->preemption_buffer_1_max_size;
>> -	else
>> -		primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
>> -
>> -	if (fw_hdr->preemption_buffer_2_max_size)
>>   		secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_max_size;
>> -	else
>> +	} else {
>> +		primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
>>   		secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
>> -
>> -	ivpu_dbg(vdev, FW_BOOT, "Preemption buffer size, primary: %u, secondary: %u\n",
>> -		 primary_preempt_buf_size, secondary_preempt_buf_size);
>> +	}
>>   
>>   	if (primary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE ||
>>   	    secondary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE) {
>> -		ivpu_warn(vdev, "Preemption buffers size too small\n");
>> +		ivpu_warn(vdev, "Preemption buffers size too small, primary %u, secondary %u\n",
>> +			  primary_preempt_buf_size, secondary_preempt_buf_size);
>>   		return;
>>   	}
> 
> [Severity: Medium]
> When fw_hdr->preemption_buffer_1_max_size is non-zero and
> fw_hdr->preemption_buffer_2_max_size is 0, won't the
> secondary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE check in
> ivpu_preemption_config_parse() in drivers/accel/ivpu/ivpu_fw.c always trigger
> a warning and return early?
> 
> The commit message notes that when preemption_buffer_1_max_size is set in the
> image header, preemption_buffer_2_max_size should be used even if it is zero,
> and ivpu_preemption_buffers_create() in drivers/accel/ivpu/ivpu_job.c is
> updated to handle vdev->fw->secondary_preempt_buf_size == 0.
> 
> However, during ivpu_dev_init() -> ivpu_fw_init() -> ivpu_fw_parse() ->
> ivpu_preemption_config_parse(), if secondary_preempt_buf_size is 0, checking
> secondary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE (where
> FW_PREEMPT_BUF_MIN_SIZE is SZ_4K) evaluates to true and returns before
> reaching:
> 
> 	vdev->fw->primary_preempt_buf_size = ALIGN(primary_preempt_buf_size, PAGE_SIZE);
> 	vdev->fw->secondary_preempt_buf_size = ALIGN(secondary_preempt_buf_size, PAGE_SIZE);
> 
> For firmware that relies on the image header sizes
> (boot_params->preemption_buffer_size == 0) with
> preemption_buffer_1_max_size > 0 and preemption_buffer_2_max_size == 0,
> vdev->fw->primary_preempt_buf_size remains 0, ivpu_fw_postboot_init() warns
> that hardware scheduling has no preemption buffer, and
> ivpu_preemption_buffers_create() skips allocating the primary preemption
> buffer.

The case with preemption_buffer_1_max_size set and
preemption_buffer_2_max_size == 0 does not occur: all known firmware
versions set both max sizes together.

> 
> In addition, on newer firmware where the deprecated image header preemption
> buffer fields are zeroed in favor of boot_params->preemption_buffer_size,
> won't ivpu_preemption_config_parse() also emit a false-positive warning on
> every probe before the boot params are read in ivpu_fw_postboot_init()?
> "Deprecated" means the boot params size takes precedence when available; 
the image header still carries valid sizes so that older kernels keep 
working, so newer firmware does not trigger the warning.


I will post patch v2 with clarified commit message.

- Andrzej
