Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E63F12F0
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594172; cv=none; b=LxgxrT72CHn7cqXPu9HuFQLhwVy/JyA1ulq2b+AsUbZAD4qzW65ybyFBj/h5b7pHo72t0jw1dLokaISCQiTA8j3M/coGB5xklVxkU8X9BJGSHgNs8Khko5MkHzPoHw4x2UYbDztRHZiuwyzVXnX3oKALTYcuSSSR25sIdHgHbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594172; c=relaxed/simple;
	bh=OFAD95/UKzUlNiWyqEdyyWeiSo4eY1mU+TAPlAvyV88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcRFYnxRiO7Y9kJ3lB7EKvKetBJW7s7AZzy6wFOVAg024rUrsKFq/MFqajVP7F/+bIcPdyZQoZaS+m3Ap+99LN21WmpemLoIxA0+IMVj/sFvlq6rKt2ttCXPpBjLf2OJGTdjQrXz3O++xjUKEx+jj8MqRNW+/RMUOcZhSnGcYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hcQJj1zFBzYQts5
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 15:41:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3D0E640573
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 15:42:43 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgB32Zbyx5tqmJ1RAw--.46762S2;
	Sat, 05 Sep 2026 15:42:43 +0800 (CST)
Message-ID: <8151b6f6-1ea6-4469-9ef7-f174fe408bb0@huaweicloud.com>
Date: Sat, 5 Sep 2026 15:42:41 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 3/3] selftests/bpf: Enable stack argument
 tests for RV64
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260905070409.4141522-1-pulehui@huaweicloud.com>
 <20260905070409.4141522-4-pulehui@huaweicloud.com>
 <20260905070911.CAB0D1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20260905070911.CAB0D1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgB32Zbyx5tqmJ1RAw--.46762S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWrJw4fCFWkZr47tF1DJrb_yoW8uw43pa
	ykZa47Kry0gF4jgFy7GrWjqr1rKw4kArWrCrs2qrZxZ3WDtryxXr1fKFW5A3s0grWruF98
	Z3WIqwnavw48A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/


On 2026/9/5 15:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch misses updating the architecture check in `tools/testing/selftests/bpf/progs/exceptions.c`, leaving stack argument exception tests permanently disabled on RV64.
> --
> 
> commit 064ba72e246734f0b6e1f3e1f7a66bfe6a3a8b0e
> Author: Feng Jiang <jiangfeng@kylinos.cn>
> 
> selftests/bpf: Enable stack argument tests for RV64
>      
> Enable the stack argument selftests for RV64. The riscv guard is
> restricted to __riscv_xlen == 64 since stack arguments are only
> supported by the RV64 JIT.
> 
>> diff --git a/tools/testing/selftests/bpf/progs/stack_arg.c b/tools/testing/selftests/bpf/progs/stack_arg.c
>> index 944e3bb603e7e..3e9ed37c57bb9 100644
>> --- a/tools/testing/selftests/bpf/progs/stack_arg.c
>> +++ b/tools/testing/selftests/bpf/progs/stack_arg.c
>> @@ -21,7 +21,8 @@ struct {
>>   
>>   int timer_result;
>>   
>> -#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
>> +#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
>> +	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && \
>>   	defined(__BPF_FEATURE_STACK_ARGUMENT)
>>   
>>   const volatile bool has_stack_arg = true;
> 
> [Severity: Medium]
> Should tools/testing/selftests/bpf/progs/exceptions.c also be updated
> with this new architecture guard?
> 
> It looks like the same has_stack_arg guard is used there:
> 
> tools/testing/selftests/bpf/progs/exceptions.c:
> 
> #if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) \
> 	&& defined(__BPF_FEATURE_STACK_ARGUMENT)
> 
> const volatile bool has_stack_arg = true;
> 
> Without updating it, the C preprocessor will take the #else branch on RV64,
> defining has_stack_arg = false. At runtime, prog_tests/exceptions.c checks
> skel->rodata->has_stack_arg and silently bypasses the stack argument exception
> tests.
> 
> Could this be added to ensure the exception tests are not permanently
> disabled on RV64?
> 

bpf exception support not yet for rv64

