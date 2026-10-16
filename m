Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4417347FC8
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 04:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124073; cv=none; b=mWV6Jm1sbkRLWQeHOJuV4t1NXsPeyZBu/OhoUAyqOXP8oxzena/4djdsQrHO8l8MqD70IIaqV3fa1G4wmDI5udwxxI9+xWsoxYEPktUG0QKeXcg4ddiaBpYPQcfqiVbAjeNMiL4UEstw4KuyJkejk70ZRgp/qE8jIqSHDNbG6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124073; c=relaxed/simple;
	bh=JobKsdQyp0QPl4TgWuf43feGoTA/YjHTrvyExa3MZXc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jb022StmhU2ql896CjrLrvOPFH9siu9bHKDmouhvVxZZ4lBAcl7gokK7PkKP2n3gB8dbM+N6M7NoSHLIdZxbj/ObDcdwK1Jjzy+KVtwI8DGPQJEXHDfsXtcoA7gkedEuabrSYGeA24v+aWzPQkqJHMAErugbxA0cBdYua9bVAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxvtKbpNFqVmMWAA--.64970S3;
	Fri, 16 Oct 2026 12:14:19 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAx3c6UpNFql_0sAA--.29236S2;
	Fri, 16 Oct 2026 12:14:16 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: KVM: Add hypercall crash support
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20261016034245.3002859-1-maobibo@loongson.cn>
 <sashiko-outbox-173719@kernel.org>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <53f3f45b-1e86-1218-ff64-d0968cc8bb9e@loongson.cn>
Date: Fri, 16 Oct 2026 12:15:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-173719@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c6UpNFql_0sAA--.29236S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF43ZrWDAr48ZFWfAr45twc_yoW8tF13pr
	n7AF4kXFZ3XF1xCan0v3929w4rWFZ7CryIvrn8CryfAF15KF98Cw1jvFWv9FWkJw1fW3W0
	vF48tryqv3WktwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8PC
	zJUUUUU==



On 2026/10/16 上午11:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm: new guest-visible KVM_FEATURE_CRASH capability is silently enabled by default
> --
> 
> commit 6d0e897e0c46a79eb02651baa4b7271884b07abb
> Author: Bibo Mao <maobibo@loongson.cn>
> LoongArch: KVM: Add hypercall crash support
> 
> This commit adds hypercall crash support (KVM_HCALL_CRASH) to LoongArch KVM
> to provide a more direct, low-level crash notification method. It allows the
> VMM to capture CPU crash context during exception entry even if the CPU
> hardware context or kernel stack is corrupted.
> 
>> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
>> index 6dabb227a7321..9bf4b3bb8f25a 100644
>> --- a/arch/loongarch/kvm/vm.c
>> +++ b/arch/loongarch/kvm/vm.c
> 
> [ ... ]
> 
>> @@ -49,8 +49,9 @@ static void kvm_vm_init_features(struct kvm *kvm)
>>   		kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_PMU);
>>   
>>   	/* Enable all PV features by default */
>> -	kvm->arch.pv_features |= BIT(KVM_FEATURE_IPI);
>> +	kvm->arch.pv_features |= BIT(KVM_FEATURE_IPI) | BIT(KVM_FEATURE_CRASH);
>>   	kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_PV_IPI);
>> +	kvm->arch.kvm_features |= BIT(KVM_LOONGARCH_VM_FEAT_CRASH);
> 
> [Severity: High]
> Does unconditionally setting BIT(KVM_FEATURE_CRASH) and
> BIT(KVM_LOONGARCH_VM_FEAT_CRASH) here break live migration and backward
> compatibility?
> 
> If a VM is migrated to a newer kernel with this patch, an older VMM unaware
> of the capability will not explicitly disable it. If the guest discovers
> and triggers the new KVM_HCALL_CRASH hypercall, the older VMM will receive
> an unexpected KVM_EXIT_SYSTEM_EVENT and will likely terminate the VM.
> 
> Should new guest-visible capabilities be left off by default and require
> explicit VMM opt-in through capability negotiation?
The design idea is that if VMM does not set pv features, kvm will enable 
all supported features. With VM migration, VMM need set pv features 
again in post migration stage, so it is the problem of VMM, rather than KVM.

Regards
Bibo Mao

