Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81349303A35
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 01:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787621953; cv=none; b=Y0L4bl7o3OVRkPczkCWV1aex5CbV3dqIsd4d86WgmU693m2LhV0ZrfmMiJIMdG6hw52rJjIz4Eig3fyScI3p8iPadynA5xvhYoPftvPiksNCz5+wn88xILNxyxJ18vaC6vO2XXnWH0//vFsJTsFTULAPuO0YqJHzz+VexYK8QdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787621953; c=relaxed/simple;
	bh=HppttFZUnV05ZjcfDIysacaMYtZ4JAJRmsjJmcj4SPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHbNfwoTs6W6h4zoMG/VxkyBpaDUcWa54aDCVBNDr5tksm9bvXPscwvExxcksAJpO5KL4J3vYCXTHJA/tC19N6gkknsH71E3ZrmyrbWjKuQFe2vbERldhPxpSAgxCl2XNhDl0sWhhSISqoAj9ScOW75WwvsDR5S8EXWqWcWv2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjaVSo6P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjaVSo6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787621951; x=1819157951;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HppttFZUnV05ZjcfDIysacaMYtZ4JAJRmsjJmcj4SPM=;
  b=jjaVSo6PpIW43ZmzSd1NEg61mxFKojfdV8Xz5n8M91YAPorHSF1/oJDn
   pJWhQkkcmCBAyH4fG3g2jyvfbgUXIZnyr8QuN/QRhTQbmyM0Sa8SDdijW
   DixKV4MIjHIgQgGpwid9INCY0yJ+0hub3W9monkFgOX6A/Q8W4CgSmNcv
   LrSLBmIjmnZfi998oMGFKjEn9cepRXf9ZRexy2FBKsZ9MmZpL1sds26nj
   WGmkbpF6G+Kk6+z4SVFm1kc6rwY4H6JLTn/Bj4DqhSuoiBJIrE0iiNSG6
   qa6LF6KES3eKyJ6WAdYQPyVoen7SkuctZMDv2tV+KoIcVWUe30W6n5T+Z
   w==;
X-CSE-ConnectionGUID: QxZXwcfITA+hTIELdTMWlQ==
X-CSE-MsgGUID: 4gsTEk5uSSWXqoiVe+coug==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88099435"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88099435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 18:39:11 -0700
X-CSE-ConnectionGUID: QKIjbG4cSjeDevp3O+PJXw==
X-CSE-MsgGUID: aIctfTmCQ3q7Hy1E1rgWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="297064615"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 18:39:10 -0700
Message-ID: <be04bda2-91d4-4af4-8d54-982480eea814@linux.intel.com>
Date: Tue, 25 Aug 2026 09:39:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND Patch v10 23/23] perf/x86/intel: Add sanity check for
 PEBS record/fragment size
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260824082731.1013973-1-dapeng1.mi@linux.intel.com>
 <20260824082731.1013973-24-dapeng1.mi@linux.intel.com>
 <20260824090815.AD6A41F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260824090815.AD6A41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/24/2026 5:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] setup_arch_pebs_sample_data() parses PEBS fragment payloads based on the presence of bit flags without verifying that the implied payload size fits within header->size or the buffer boundary.
> --
>
> --- Patch [23]: [RESEND Patch v10 23/23] perf/x86/intel: Add sanity check for PEBS record/fragment size ---
> commit 573a2a9becb54c34e2eef68662afc34b55c514f9
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86/intel: Add sanity check for PEBS record/fragment size
>
> This patch adds sanity checks for corrupted PEBS records or fragment
> sizes to prevent potential infinite loops. If a corrupted fragment is
> detected, the entire PEBS record and all subsequent records are dropped.
>
>> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
>> index 39028de75e4f6..4448144387158 100644
>> --- a/arch/x86/events/intel/ds.c
>> +++ b/arch/x86/events/intel/ds.c
>> @@ -2657,6 +2657,9 @@ static void setup_arch_pebs_sample_data(struct perf_event *event,
>>  
>>  again:
>>  	header = at;
>> +	if (!header->size)
>> +		return;
>> +
>>  	next_record = at + sizeof(struct arch_pebs_header);
>>  	if (header->basic) {
> [Severity: High]
> This is a pre-existing issue, but since this patch explicitly aims to safely
> handle corrupted PEBS records, could a corrupted record have a small
> header->size but multiple structural flags set?
>
> In setup_arch_pebs_sample_data(), next_record is advanced based on the
> presence of bit flags without checking against header->size or the buffer
> boundary:
>
>     if (header->gpr) {
>         gprs = next_record;
>         next_record = gprs + 1;
>         __setup_pebs_gpr_group(event, regs, ...);
>
> Would this lead to out-of-bounds memory reads if the hardware generates a
> corrupted record where the implied payload exceeds header->size? While
> intel_pmu_drain_arch_pebs() checks that header->size fits in the buffer,
> it doesn't seem to verify if the payload itself fits within header->size.

Yes, this concern could happen in theory. This patch mainly focus on the 0
size issue, the issue could be addressed by another patch if necessary. Thanks.


>
