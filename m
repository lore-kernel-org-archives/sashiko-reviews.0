Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5A3537C7
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 03:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786504837; cv=none; b=CtIvr4siPy+hQ9NxW6nzyxFipKam9FNC1ZJGVRcFXfn5gR9iUGrS9ITQn7cH8Lleg8ISBjzbghOWSxpFCpMbwNYffANb5JCimMAKH+HAw5tt4Z8ikdLyk4dymgpN0F5+WqSQwX+EiuDIRA57MXO2d63bVsnXGF1IlxnLg+LeMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786504837; c=relaxed/simple;
	bh=pf1Izqmm8qMk1Rs8eYqGQ2WUItGOSWftP7N2H8ZXY2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY3e1s5OWdCzMHKLFAdmaE2OmG17M3D++GBDOHEVZQ95WXrMcd4u73sI1GUUJ0kNiCvSMRn4RT7fQsjzjvcvN6gvYIPV8LlN4OH3yXyyxHaY0pdHGBbReYpsCyx4C5cl68bY9xfRSD/q1TjL7lz1ZxEz1MB2Fq/EHIIOtHLWgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/SjMQG0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/SjMQG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786504837; x=1818040837;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pf1Izqmm8qMk1Rs8eYqGQ2WUItGOSWftP7N2H8ZXY2A=;
  b=Y/SjMQG0AlOrNbgsWRyy+XNCBraeMyu8xxdnbWiUijzjLwSq/HUtDzrt
   Bd3AtUFVID86oqw+FfrgIy0nXfxTWNyrvAA616Z1lwneMKNj1SUBLFaJE
   d/igdv5dgbTEJYHDMljTXc3KBW2xO+r5ao1ljKC+I2T5aVdmpmeL56YbL
   riLy/z1GRTFJDYnlbPt1Ok0WAH0frZSxnNLu2vvPFLYi5jdfJddbA+Fja
   zdbMrIDCLcJycxQjpbU2kZy072uxjvoETu7VdgPauknqBPo28oCUqaM0z
   37R/CmhkNbklg0epalP2yhogqxCL65uwHqmJQPsOUDuaPJrJEKyIkKl68
   A==;
X-CSE-ConnectionGUID: xwUxA1eBSMqi2dmF3yv0jQ==
X-CSE-MsgGUID: y1aqUdPWTNKfeOuz5Ufjmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109837451"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="109837451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 20:20:36 -0700
X-CSE-ConnectionGUID: avSV+OqBTNCyyKyBuLc8ng==
X-CSE-MsgGUID: 9YYSkj2nR72Spn6FHTlGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="268662293"
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 20:20:34 -0700
Message-ID: <95d81370-3244-43c8-a6fb-6c2146d24dda@intel.com>
Date: Wed, 12 Aug 2026 11:20:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com>
 <20260810113924.4ACBE1F000E9@smtp.kernel.org>
 <13ea6279-a342-493b-a0f8-15ac5b4c59ad@intel.com>
 <anplcWfYReCMeu1A@google.com> <anpnFAK6EZToizbZ@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <anpnFAK6EZToizbZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/2026 8:04 AM, Sean Christopherson wrote:
> On Mon, Aug 10, 2026, Sean Christopherson wrote:
>> On Mon, Aug 10, 2026, Xiaoyao Li wrote:
>>> On 8/10/2026 7:39 PM, sashiko-bot@kernel.org wrote:
>>>>> @@ -2147,7 +2156,7 @@ void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
>>>>>    	struct vcpu_tdx *tdx = to_tdx(vcpu);
>>>>>    	*reason = tdx->vt.exit_reason.full;
>>>>> -	if (*reason != -1u) {
>>>>> +	if (tdx->vt.exit_reason.basic != -1) {
>>>> [Severity: Medium]
>>>> Will this check always evaluate to true due to C integer promotion rules?
>>>>
>>>> The basic field in union vmx_exit_reason is a 16-bit unsigned bitfield. When
>>>> comparing it to -1, the unsigned 16-bit value is promoted to a signed 32-bit
>>>> integer. If the value was set to -1 (65535), the comparison evaluates as
>>>> 65535 != -1, which is always true.
>>>>
>>>
>>> Well, how about something below on top of this patch?
>>
>> No, we need to not rely on magic exit_reason.basic values.  Can't this be?
>>
>> 	if ((tdx->vp_enter_ret & TDX_SW_ERROR) != TDX_SW_ERROR) {
> 
> This would arguably be a bug fix as well, because the "real" EXIT_REASON_EPT_MISCONFIG
> path gets a false negative.  E.g. when getting information for an EPT Misconfig
> for the tracepoint, KVM really should print all information, not zeros.
> 
> At a glance, this exact change can probably be a separate patch too.

Yeah, this issue can be fixed by the patch which turns real 
EPT_MISCONFIG to TDX_SW_ERROR.

Side topic, tdx_to_vmx_exit_reason() can change EXIT_REASON_TDCALL to 
other Exit Reason. Do we want to print TDCALL instead of the transformed 
reason here?

>> 		<read values>
>> 	} else {
>> 		<zero values>
>> 	}
>>
>> We'd need to use the unsafe version if we go with my suggestion[*], but other
>> than that wrinkle, the above seems like the obviously correct fix (maybe too
>> obvious)?
>>
>> [*] https://lore.kernel.org/all/anXxBzO41_5eaaOI@google.com

