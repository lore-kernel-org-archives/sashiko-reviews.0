Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A5638AC83
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567992; cv=none; b=OM1NHpwmZUx+8Fecf9KovVE3A3z7dWNxGnQqgxSiPiJyevFDkL3v6/kMsBaIrG1ztImH0EyyyNvG/ZV5FGAZEkXs5oweHmKpW4PkwKKVCFIM6GZtKawInrCUY7/O9g75lAbLZNX+R0H8sumpCO2KYtDMQwcLzJSgpd5gQXx6N4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567992; c=relaxed/simple;
	bh=q9V5s5y1iSQ74XrB5P54HxA0czOtEoTctnz/+G4QLNE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=szsBsPexuNegEPPV4wB8j2+ICQrqr1F3phUgxRcFCJ7JssHT0Y576i6Ojzu5IQLuDMJT6JhItJQSaczyr/LnNo0IPYcPPpna7HpX2CFCxuODxWqd9un/uzdAO3guQ5eor1Ng6NY83XwyFNqB5tKYBeNu9fFYM4xNF4KHrKzbjlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxBOpqFk9qcLUBAA--.2125S3;
	Thu, 09 Jul 2026 11:32:59 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxPsdgFk9qRWsGAA--.11757S2;
	Thu, 09 Jul 2026 11:32:49 +0800 (CST)
Subject: Re: [PATCH bpf-next v9 2/2] bpf: Reject programs with inlined helpers
 if JIT is not available
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260708101806.18885-1-yangtiezhu@loongson.cn>
 <20260708101806.18885-3-yangtiezhu@loongson.cn>
 <20260708104324.BE58C1F000E9@smtp.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <03339dc1-f23e-e4a0-2f9c-a97f8fe51897@loongson.cn>
Date: Thu, 9 Jul 2026 11:32:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260708104324.BE58C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPsdgFk9qRWsGAA--.11757S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4ftr47Kr48JF47Cry8WFX_yoW5GrWfpF
	sxKw4ak34DXF92kasrt3y8Ww1Ygw48G3W7Gr1rGry0k3WavFn3XF1fKw17u3W5Cr4vy3WI
	vr4I9ryvk3WDGFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UU
	UUU==

On 2026/7/8 下午6:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch unconditionally sets `prog->jit_required = 1` and skips instruction patching for helpers that can be JIT-inlined, which unnecessarily breaks the execution of these BPF helpers under the BPF interpreter when JIT is globally disabled.
> --
> 
> --- Patch [2]: [PATCH bpf-next v9 2/2] bpf: Reject programs with inlined helpers if JIT is not available ---
> commit 28807bd656d66a091e77d8589e0c48bef3c4c778
> Author: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> bpf: Reject programs with inlined helpers if JIT is not available
> 
> This commit modifies bpf_do_misc_fixups() to set prog->jit_required = 1
> when bpf_jit_inlines_helper_call() returns true. This is intended to prevent
> a kernel panic when JIT compilation fails or is disabled and the interpreter
> tries to execute an unpatched helper call with a raw ID.
> 
>> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
>> index 02246df2f6c36..d3be972714b22 100644
>> --- a/kernel/bpf/fixups.c
>> +++ b/kernel/bpf/fixups.c
>> @@ -1840,8 +1840,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
>>   		}
>>   
>>   		/* Skip inlining the helper call if the JIT does it. */
>> -		if (bpf_jit_inlines_helper_call(insn->imm))
>> +		if (bpf_jit_inlines_helper_call(insn->imm)) {
>> +			prog->jit_required = 1;
>>   			goto next_insn;
>> +		}
> 
> [Severity: High]
> Does this unnecessarily reject valid programs when JIT is globally disabled?
> 
> If JIT is disabled (net.core.bpf_jit_enable=0), prog->jit_requested will be
> false. By unconditionally skipping the instruction patching and setting
> prog->jit_required = 1, valid BPF programs using standard helpers (like
> bpf_get_smp_processor_id) will be rejected on architectures supporting this
> JIT inlining.
> 
> If this code instead checked whether JIT was actually requested:
> 
>      if (prog->jit_requested && bpf_jit_inlines_helper_call(insn->imm)) {
>          prog->jit_required = 1;
>          goto next_insn;
>      }
> 
> Would this allow the code to fall through and rewrite the offset when JIT is
> disabled? This would correctly resolve the helper's C function address,
> safely allowing the BPF interpreter to execute these standard helpers without
> crashing, while still preventing the runtime panic if dynamic JIT compilation
> fails.

If JIT is not available, rejecting the loading of programs
with inlined helpers is the intended design.

Thanks,
Tiezhu

