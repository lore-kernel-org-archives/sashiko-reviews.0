Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60DE2D7DFE
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066039; cv=none; b=A38hgj/9OCpDfpgbPpyQb+1xwYeBc14WOLdSnhzJRN4PMVZhqk+3MS0RWjBFW8RubmafcrnAGDnSNltwzl1ZPd3AKwqjrPFRRJ/sX7iy1d5Lvo9OX6xPvM447Jh2mbO/E1jc2Y+FXPw4V76d7sihCcDwuJVre+ITnTtrV+pwzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066039; c=relaxed/simple;
	bh=VhyqlfnhP9NNQMhrckXYfNjbp7VYJ7cib9oU38Dqvp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkIDz27+AnARtIVVe0RjPh/pJYrWz1naHO+AdzkeHTG/ykv1tWKCy0PkGejiUXgoP3xqn6dNQ1MN2QfO7FxZhUhT+OCSWwqCZk/AxHSJrcgmexIStbkiYu1gElcb6fklleOI1b71zz1NLpYu/YRC9DsYX5kUpV2SmVvZ6h0mk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwlQPtdl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwlQPtdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786066032; x=1817602032;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VhyqlfnhP9NNQMhrckXYfNjbp7VYJ7cib9oU38Dqvp4=;
  b=fwlQPtdldQ1x18uDGr4Yf0OMspmw0zOzL6HpK6uTVHcnY41JgveQcaTm
   l6uveSAaeTnnaThKz9SdoquMarAexBHLflYIFSOTtTMsY11CaXPZl7LXd
   TBYEj76pkICyTDNyFSjkjyATdlDkahtZLXwbVMUw8JgXCfkEyXYY4q5oU
   FBV0Us/4zGJUaEc/wWJsEs7QroAGUAQR+hLEff8WfJWJuyDTEi7yPogTJ
   Bz1DAQ7W9W8GsoAPxi9ATF3/0peOdTKDPhrX04JRaURDn18/+3LCkaNrN
   DdnDt0/HXFkvT8ox+oM2zOPEmSN49sB5pfyIdoLfqhn6ZtdUfjNFcjPvy
   w==;
X-CSE-ConnectionGUID: wSD2cXABSxyWdUpjPv7rfA==
X-CSE-MsgGUID: 9JJwefGMQkaDSDq45ItlWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86546320"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86546320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 18:27:08 -0700
X-CSE-ConnectionGUID: 2HCB+m+qRN6ZqWM12C8/hw==
X-CSE-MsgGUID: rG1qo2ViRxaQ2/2h0g78jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266499713"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.248]) ([10.124.240.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 18:27:07 -0700
Message-ID: <f9847f77-908b-48e9-b3a4-af487bbed97f@intel.com>
Date: Fri, 7 Aug 2026 09:27:04 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] KVM: x86: Reject enabling KVM_CAP_X86_BUS_LOCK_EXIT
 when !kvm_caps.has_bus_lock_exit
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260806111923.1990562-1-xiaoyao.li@intel.com>
 <20260806111923.1990562-3-xiaoyao.li@intel.com>
 <20260806113501.3F28C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260806113501.3F28C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/2026 7:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Modifying the VM-wide state `kvm->arch.bus_lock_detection_enabled` lacks protection from `kvm->lock` and does not verify that no vCPUs have been created yet.
> --
> 
> --- Patch [2]: [PATCH 2/3] KVM: x86: Reject enabling KVM_CAP_X86_BUS_LOCK_EXIT when !kvm_caps.has_bus_lock_exit ---
> commit e0edfcdc943c7835281cad8477ff3399dfe81a05
> Author: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> KVM: x86: Reject enabling KVM_CAP_X86_BUS_LOCK_EXIT when !kvm_caps.has_bus_lock_exit
> 
> This commit returns -EINVAL to reject enabling KVM_CAP_X86_BUS_LOCK_EXIT
> or KVM_BUS_LOCK_DETECTION_OFF from userspace when kvm_caps.has_bus_lock_exit
> is false. It aims to keep the API behavior consistent when KVM does not
> support bus lock exit.
> 
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index afcac1042947a..91895a3d6f857 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -6835,8 +6835,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>   		    (cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT))
>>   			break;
>>   
>> -		if (kvm_caps.has_bus_lock_exit &&
>> -		    cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT)
>> +		if (!kvm_caps.has_bus_lock_exit)
>> +			break;
>> +
>> +		if (cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT)
>>   			kvm->arch.bus_lock_detection_enabled = true;
> 
> [Severity: High]
> This is a pre-existing issue, but does setting the VM-wide flag
> bus_lock_detection_enabled here in kvm_vm_ioctl_enable_cap() require
> kvm->lock protection and a check for !kvm->created_vcpus?
> 
> If userspace calls KVM_ENABLE_CAP for KVM_CAP_X86_BUS_LOCK_EXIT concurrently
> with or after KVM_CREATE_VCPU, existing vCPUs might miss the update. This
> could lead to an inconsistent state where some vCPUs mitigate bus lock DoS
> and others do not, leaving the host vulnerable.

This is addressed by the next patch.

>>   		r = 0;
>>   		break;
> 

