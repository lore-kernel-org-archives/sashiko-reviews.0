Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com [115.124.28.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900F243387
	for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 02:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788057779; cv=none; b=dx3jLFA1BAnRfSGoQtiq7BVDbPx5/p6g9sMX3UhZVPDlleLDxCJS+EVXPdwV0I74JdNt9jiW8vruCJOTpjaQ/J7qW6jNbYFXpMO5EB/vTw0/SeRUxymaP7rBTqVRxNaURxqPAvTyDtAE9i3d2NjbLO9KtigZpK7Oac4CxOq6c0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788057779; c=relaxed/simple;
	bh=FGYsF2k1q65N8lxbWDM4vr0Zj16VANo3oMImr4jkcG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRUBJoIu8u/TrsnHaigIJEuFHWfWdgZro/c0yGD8dMiqosoc2RFFLAS4kQzXr16axZ6nU/qP9m5LTJHFIESRC27DhHJoleJE27ipxKGue5ZG5Rbw2ruYKr+WDMYHjpQe7vjjO2esYzDVdPPW1C23XZdmRjSNACyVDoJMxXq45QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08696488|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0292237-0.000101892-0.970674;FP=4929523117646727027|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=zhang_wei@open-hieco.net;NM=1;PH=DS;RN=2;RT=2;SR=0;TI=SMTPD_---.j0.ERXi_1788057448;
Received: from 192.168.1.4(mailfrom:zhang_wei@open-hieco.net fp:SMTPD_---.j0.ERXi_1788057448 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 30 Aug 2026 10:37:29 +0800
Message-ID: <66d1f990-7250-443d-beb5-ac46bd2bfe17@open-hieco.net>
Date: Sun, 30 Aug 2026 10:37:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260824123954.315112-1-zhang_wei@open-hieco.net>
 <20260824123954.315112-3-zhang_wei@open-hieco.net>
 <20260824131149.0660C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Tina Zhang <zhang_wei@open-hieco.net>
In-Reply-To: <20260824131149.0660C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the review. Both reports appear to be false positives.

For MOV CRx, AMD APM 15.8.1 defines EXITINFO1 bit 63 as the “instruction 
was MOV CRx” flag. MOV CR instructions set it regardless
of the guest execution mode; it is not an operand-size or 64-bit-mode
indicator.

For INVLPG, the register-operand path is unreachable. The x86 emulator's
group7 dual opcode table selects INVLPG only for ModR/M memory forms
(mod != 3). A mod=3 encoding is dispatched through group7_rm7 and never
produces x86_intercept_invlpg. Valid register-indirect forms such as
INVLPG (%eax) are decoded as OP_MEM, so addr.mem.ea does not alias a 
host register pointer.

Thanks,
Tina

On 8/24/2026 9:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Unconditionally setting bit 63 for `MOV CRx` intercepts violates the AMD specification and causes L1 KVM to spuriously inject a #GP into 32-bit L2 guests.
> 
> Pre-existing issues:
> - [High] Host kernel pointer leak (KASLR bypass) when emulating INVLPG with a register operand.
> --
> 
> --- Patch [2]: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for emulated intercepts ---
> commit 8b2926ca93c673e51f89c3e65becdb72f34b66f7
> Author: Tina Zhang<zhang_wei@open-hieco.net>
> 
> KVM: nSVM: Synthesize DecodeAssists EXITINFO for emulated intercepts
> 
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO fields when
> DecodeAssists is exposed to L1.
> 
>> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
>> index 9d607b98bd067..c7c1f1527c3cf 100644
>> --- a/arch/x86/kvm/svm/svm.c
>> +++ b/arch/x86/kvm/svm/svm.c
>> @@ -4810,6 +4810,52 @@ static const struct __x86_intercept {
> [ ... ]
> 
>> +	switch (info->intercept) {
>> +	case x86_intercept_cr_read:
>> +	case x86_intercept_cr_write:
>> +		/* MOV CRx: bit 63 set, GPR number in bits 3:0. */
>> +		exit_info_1 = BIT_ULL(63) | (info->modrm_rm & 0xf);
> [Severity: Medium]
> Does unconditionally setting bit 63 here violate the AMD specification for
> 32-bit L2 guests?
> 
> If an L2 guest running in 32-bit mode issues a MOV CRx instruction that gets
> emulated by L0 (e.g. via KVM_FEP), L0 will synthesize a nested VM-Exit to L1
> and unconditionally set bit 63 (CR_VALID) in EXITINFO1.
> 
> L1 KVM will see bit 63 set, assume it is a 64-bit operation, read the full
> 64-bit GPR (which may contain garbage in the upper 32 bits from 32-bit
> execution), and pass it to kvm_set_cr4(). This would fail the reserved-bit
> check, causing L1 to spuriously inject a #GP into the 32-bit L2 guest.
> 
>> +		break;
>> +	case x86_intercept_clts:
> [ ... ]
> 
>> +	case x86_intercept_intn:
>> +		/* INTn: software interrupt number in bits 7:0. */
>> +		exit_info_1 = info->src_val & 0xff;
>> +		break;
>> +	case x86_intercept_invlpg:
>> +		/* INVLPG: linear address of the target page. */
>> +		exit_info_1 = info->intercept_linear_addr;
> [Severity: High]
> This is a pre-existing issue, but does assigning info->intercept_linear_addr
> here leak a host kernel pointer (KASLR bypass) to the L1 guest?
> 
> If an L2 guest places an INVLPG instruction with a register operand
> (e.g. INVLPG %eax) across an MMIO page boundary, KVM is forced to emulate it.
> 
> decode_modrm() correctly identifies it as a register operand and stores a host
> kernel pointer in addr.reg.
> 
> Later, get_intercept_linear_addr() blindly reads addr.mem.ea (which aliases
> addr.reg), extracting the host kernel pointer:
> 
> arch/x86/kvm/emulate.c:get_intercept_linear_addr() {
>      ...
>      la = seg_base(ctxt, ctxt->src.addr.mem.seg) + ctxt->src.addr.mem.ea;
>      ...
> }
> 
> By writing info->intercept_linear_addr to exit_info_1 here, the host KASLR
> offset is exposed to the L1 guest in the synthesized VM-Exit.
> 
>> +		break;
>> +	case x86_intercept_invlpga:
>> +		/* INVLPGA: the address remains available in guest rAX. */
>> +		exit_info_1 = 0;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	vmcb->control.exit_info_1 = exit_info_1;
>> +	vmcb->control.exit_info_2 = 0;
>> +}
> -- Sashiko AI review · https://sashiko.dev/#/ 
> patchset/20260824123954.315112-1-zhang_wei@open-hieco.net?part=2
> 

