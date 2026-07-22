Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919F33D6F0
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709298; cv=none; b=kArg2OcllywK9498HOlroGaV+QkGre+IO2vfmN+4PMOsFCduFrguGm3esWamQzgKpUTMlmqWV2vmWuMc2EMKcznG53Gu9T96LUKjGJJwzYL5mwp4YJmkgXMYMnLVrtzCb9ITES5LKTESu6SF4dyiOtOIaRGxAl4TPggaP05wqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709298; c=relaxed/simple;
	bh=yGtJhkk5woVZcQnJw+HrpiMig7EeQ/Pb6XReWsMCqO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NbEAoiMjkiqoEwyYVtXnlvjpoWzhUxfrsMkezDcsxNVSsyaLK16pH9weyGuCvUPoGhnX2d0cCm92+o5mbrgYvcYc7TdyAayjaPK+9HgXfMB0Gf+9xic/aFnmwm++SSgZG8tW7j2THDoj2vNStgQ0C2QFZFsDBENVhGqVnVW2Tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h4nbx1tdLzYQttb
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 16:34:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 00A9540594
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 16:34:49 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgDHrSmogGBqiUKJCA--.15023S2;
	Wed, 22 Jul 2026 16:34:49 +0800 (CST)
Message-ID: <3322e323-da9d-453d-8c41-470e4649684a@huaweicloud.com>
Date: Wed, 22 Jul 2026 16:34:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] e1000e: Fix out-of-bounds MMIO access by
 validating BAR0 size
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, sashiko-reviews@lists.linux.dev
References: <20260722031603.1471127-1-pulehui@huaweicloud.com>
 <20260722033703.2E5A71F000E9@smtp.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20260722033703.2E5A71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDHrSmogGBqiUKJCA--.15023S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW8urWrXFW8ZFykXw18Xwb_yoW5uF47pa
	95Was8uF48Jrsaqa1qvw18ZFyDCa13tFWUGFyYqrn0va45ur18KrW3KrW5u347Xw4kuryI
	qrsYy343ZF4DJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/


On 2026/7/22 11:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The newly introduced minimum BAR0 length check `E1000_MMIO_LEN_MIN` is too small because it fails to account for flash registers mapped into the GbE memory space for newer MACs, leaving the driver vulnerable to the same OOB MMIO access panics it attempts to fix.
> --
> 
> --- Patch [1]: [PATCH net v3] e1000e: Fix out-of-bounds MMIO access by validating BAR0 size ---
> commit 9c24a014d2bfbd3a6822ff92be6a5c7aceb588d4
> Author: Pu Lehui <pulehui@huawei.com>
> Subject: e1000e: Fix out-of-bounds MMIO access by validating BAR0 size
> 
> This patch adds a check during e1000_probe() to validate that the device's
> BAR0 size is large enough to cover the highest register offset (E1000_SYSSTMPH)
> accessed by the driver. This is intended to fix a kernel panic caused by
> out-of-bounds MMIO reads when dealing with small BAR0 allocations.
> 
>> diff --git a/drivers/net/ethernet/intel/e1000e/regs.h b/drivers/net/ethernet/intel/e1000e/regs.h
>> index 6c0cd8cab3ef2..1e875227eef24 100644
>> --- a/drivers/net/ethernet/intel/e1000e/regs.h
>> +++ b/drivers/net/ethernet/intel/e1000e/regs.h
> [ ... ]
>> @@ -242,4 +242,7 @@
>>   /* PHY registers */
>>   #define I82579_DFT_CTRL	PHY_REG(769, 20)
>>   
>> +/* Smallest BAR0 that covers every register the driver accesses */
>> +#define E1000_MMIO_LEN_MIN	(E1000_SYSSTMPH + sizeof(u32))
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this minimum length
> cover all register accesses for newer MACs?
> 
> For MAC types e1000_pch_spt and newer, the driver accesses flash registers
> mapped at E1000_FLASH_BASE_ADDR (0xE000). For example, during flash read:
> 
> drivers/net/ethernet/intel/e1000e/ich8lan.c:e1000_init_nvm_params_ich8lan() {
>      ...
>      hw->flash_address = hw->hw_addr + E1000_FLASH_BASE_ADDR;
>      ...
> }
> 
> And then later accesses like:
> 
> drivers/net/ethernet/intel/e1000e/ich8lan.c:e1000_read_flash_data32_ich8lan() {
>      ...
>      *data = er32flash(ICH_FLASH_FDATA0);
>      ...
> }
> 
> This results in an access at offset 0xE010 (57360 bytes).
> 
> Since E1000_MMIO_LEN_MIN is currently based on E1000_SYSSTMPH
> (0xB64C + 4 = 46672 bytes), could a malicious or mocked PCI device expose a
> BAR0 size of 12 pages (49152 bytes), pass this new check, and still trigger
> an out-of-bounds MMIO read panic when accessing the flash space?
> 

Hi Andrew,

Sashiko is right about this one.

On ich chipsets, the driver sets the flash base address like this:

hw->flash_address = hw->hw_addr + E1000_FLASH_BASE_ADDR; // 0xE000

Then it accesses flash registers up to ICH_FLASH_PR0 (0x0074), so the 
max offset ends up being 0xE000 + 0x0074 + sizeof(u32) — that’s about 
57.1 KB. Pretty subtle, and yeah, we totally missed it in v3.

Since PCI BAR sizes are power-of-two aligned, the smallest standard BAR 
size that can cover accesses beyond 57.1 KB is 64 KB.

So for v4, I’d like to set E1000_MMIO_LEN_MIN to SZ_64K. That keeps us 
safely covering the largest register offset we use, avoids fragile 
hardcoded values, and should be more future-proof if other chipset flash 
ranges come into play.

wdyt? :)

Thanks,
Lehui

