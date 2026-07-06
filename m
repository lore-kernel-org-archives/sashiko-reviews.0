Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B33346A5
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322195; cv=none; b=uzeOZ5nPTS9HqPDyc7iLuIii/IN5yzs2e4iuMMvQS4JTc2/CLPOFIChQzwTzliuqr+E08doh5uumK8wyAWcyMiPm0uiZLBXb/gib2H6FsH5sFUjnjn9RKAGA34KDrBcPW4VmljZVc+E/FSIN2QpysKC6nHx5mcUok++u8jKST10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322195; c=relaxed/simple;
	bh=kgXah6n51TyteeSI5ydfFZUYRLBPP/lylm0gZOVX5/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udi8QH4ikvOrbyWR9x1ropAAsamOLg9czQ2+UaQgTwoEtNFNRAHwVNEBFqqWNPykfLFzmpbFXb8+ErCoZp2+87n8yNm7PSl3xFysqIi7LW5qDaRACnecgEynDTiznRNO9w0AOrTPZNGitqYD3Zh6LWCcRJ3puhQLFGNAAeDv5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gtwd160tpzKHMMV
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 15:16:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 37FD14056B
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 15:16:23 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgBnl1hHVktq3zHzAA--.44980S2;
	Mon, 06 Jul 2026 15:16:23 +0800 (CST)
Message-ID: <d06d419f-2a64-44dc-b8cc-0b1847c8cdeb@huaweicloud.com>
Date: Mon, 6 Jul 2026 15:16:22 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 5/6] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
 <20260629140048.733346-6-pulehui@huaweicloud.com>
 <20260629140650.0806D1F000E9@smtp.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20260629140650.0806D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgBnl1hHVktq3zHzAA--.44980S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryDuF4rAr17ur15ZFWrKrg_yoW5tFy7pa
	97Ca1rCrWkZF10yrsrG3WxXa13KrWvyFW3ur1rKFs3Aan09r93G3W3Ka1F9Fy5Jr4Ikr1F
	qr4qv3Z8Za4DC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1wL05UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/


On 2026/6/29 22:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The RISC-V BPF JIT corrupts the Tail Call Counter (TCC) when returning from subprograms (bpf2bpf calls) or trampoline calls, breaking the maximum tail call limit and potentially causing stack overflows.
> --
> 
> commit 5d936090d578733fdafd16fde93ba7223525701c
> Author: Pu Lehui <pulehui@huawei.com>
> 
> riscv, bpf: Mixing bpf2bpf and tailcalls
> 
> This commit implements mixing bpf2bpf and tailcalls for the RISC-V JIT.
> It transitions to passing the Tail Call Counter (TCC) between functions
> using a non-callee saved register and explicitly saves it to the stack
> across calls to preserve its value.
> 
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index c239696cca646..384b490c48579 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> @@ -1254,6 +1240,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>>   		ret = emit_call((const u64)__bpf_tramp_exit, true, ctx);
>>   		if (ret)
>>   			goto out;
>> +	} else if (flags & BPF_TRAMP_F_TAIL_CALL_CTX) {
>> +		/* restore TCC to RV_REG_TCC before calling the orig bpf func */
>> +		emit_ld(RV_REG_TCC, -tcc_off, RV_REG_FP, ctx);
>>   	}
> 
> [Severity: High]
> If BPF_TRAMP_F_CALL_ORIG is set, the preceding if block will execute and this
> else if branch will be completely skipped.
> 
> Does this mean the trampoline skips restoring RV_REG_TCC before returning to
> the caller, thereby leaking a clobbered TCC back to the calling function?

Right, TCC will be limited before calling fexit prog, and fexit prog 
will init RV_REG_TCC, so need to restore TCC from stack to RV_REG_TCC 
after calling fexit prog.

> 
> [ ... ]
> 
>> @@ -1837,10 +1826,18 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>>   			}
>>   		}
>>   
>> +		/* restore TCC to RV_REG_TCC before bpf2bpf call */
>> +		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
>> +			emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
>> +
>>   		ret = emit_call(addr, fixed_addr, ctx);
>>   		if (ret)
>>   			return ret;
>>   
>> +		/* store updated TCC back to stack after bpf2bpf call */
>> +		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
>> +			emit_sd(RV_REG_SP, ctx->tcc_offset, RV_REG_TCC, ctx);
>> +
>>   		if (insn->src_reg != BPF_PSEUDO_CALL)
>>   			emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_A0, ctx);
>>   		break;
> 
> [Severity: High]
> Since RV_REG_TCC (a6) is a caller-saved register, if the subprogram executes
> any BPF helper calls, won't a6 be clobbered?
> 
> Looking at __build_epilogue(), there doesn't appear to be any code to restore
> RV_REG_TCC from the subprogram's stack slot before it returns to the caller.
> 
> If the subprogram returns with a clobbered a6, does this emit_sd() blindly
> save that garbage value as the new TCC on the caller's stack? Could this
> corrupt the tail call limit counter and potentially lead to infinite tail calls
> or stack overflows?
> 

Right, we have to make sure the prologue always pushes the TCC to the 
stack, and the epilogue always restores it from the stack back into the 
TCC register. Others, the following situation will break the TCC limit.

        subprog0 -> tail0 -> tail1
main <
        subprog1 -> tail2 -> subprog1

Will fix it next, thanks sashiko.

