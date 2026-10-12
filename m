Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D274570D1;
	Mon, 12 Oct 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797957; cv=none; b=WGo1IMTNM7AZlhG7+ax2w20HaNUcDs12beStPhaaHPs8zSLwbPQVmH+KluuM7svGFZJtlh13O5ivN30c0Kccna0rmFpt5eoPWXRctYcxFod3p7DY4Z/rC0w9Hs5Cf0jzLlZnTtTnvzpbHH8xnVXRW1mEIWPp9PlMAay/g+dhLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797957; c=relaxed/simple;
	bh=nZndpXnXWRtkLdimM7Adpe9MgXmm/i7kOdL28BmGSe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVryVY1qqlMikX92zQRNLDdTPP3PMynxiahyA01CfL93LzmpULR8b2rEwxPQfqr4att2F0NI10ILHWQoKosRs/hVJR79IoXdiZDO4ExN6PnmoL7PBazAfLHcb/6MZ3lK11Jyoy/jofv+rF8bgYDR8psWY6C1pjLK82m7PpPnOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8CxPtPBqsxqi+gUAA--.60747S3;
	Mon, 12 Oct 2026 17:39:13 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJDxRs2+qsxqq2UrAA--.13156S2;
	Mon, 12 Oct 2026 17:39:12 +0800 (CST)
Message-ID: <489cbda7-ef80-4bb7-a9dc-5fb293d075eb@loongson.cn>
Date: Mon, 12 Oct 2026 17:36:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] mfd: loongson-se: Fix miscellaneous issues
To: sashiko-reviews@lists.linux.dev, Qunqin Zhao <zhaoqunqin@163.com>,
 lee@kernel.org
Cc: mfd@lists.linux.dev
References: <20261008073151.15808-1-zhaoqunqin@163.com>
 <20261008073151.15808-3-zhaoqunqin@163.com>
 <sashiko-outbox-163780@kernel.org>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <sashiko-outbox-163780@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxRs2+qsxqq2UrAA--.13156S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3GFyrGw4DWw4fKryxAr45twc_yoWxWw4kpF
	W293yYkFWDJr10kwn0qa1rZFyYv395JF9xC3Z3tFW8CFn8Cw10gry5tF1UW3y3urn8GF1j
	qFWvga1ku3WkCagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==


在 2026/10/8 15:45, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] mfd: loongson-se: hardware wedging due to interruptible wait in engine commands
> - [Medium] mfd: loongson-se: Bespoke parent-child accessors and inter-driver callbacks violate MFD API
> --
>
> commit 6e6ed05719359ac0c5fefbfd5ea2f85ac87b10f6
> Author: Qunqin Zhao <zhaoqunqin@loongson.cn>
> mfd: loongson-se: Fix miscellaneous issues
>
> This commit addresses multiple historical driver issues discovered by the
> Sashiko Automation system within the loongson_se_probe() initialization flow
> and the driver's interrupt service routines. It adds bounds checks,
> initializes completion structures, and handles errors more robustly.
>
> Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]
>
>> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
>> index 969378518065b..2fb5da85b2479 100644
>> --- a/drivers/mfd/loongson-se.c
>> +++ b/drivers/mfd/loongson-se.c
> [ ... ]
>> @@ -70,18 +101,31 @@ static int loongson_se_send_controller_cmd(struct loongson_se *se,
>>  	if (err)
>>  		return err;
>>  
>> -	return wait_for_completion_interruptible(&se->cmd_completion);
>> +	/*
>> +	 * Wait for the controller to complete the command.  Use a bounded
>> +	 * non-interruptible wait: a pending signal must not leave the
>> +	 * controller running while its DMA buffers are being torn down.
>> +	 * One second is far more than any controller command should take,
>> +	 * while still bounding the wait if the hardware wedges.
>> +	 */
>> +	if (!wait_for_completion_timeout(&se->cmd_completion, HZ))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>>  }
>>  
>>  int loongson_se_send_engine_cmd(struct loongson_se_engine *engine)
>>  {
>> +	int err;
>> +
>> +	loongson_se_reinit_completion(engine->se, &engine->completion, BIT(engine->id));
>> +
Hi,

Thanks for the review.

Note that both issues below are pre-existing in this driver and are not
introduced by this series. If it's fine with you, I'd like to address them
in a separate follow-up series to keep this one focused.
>> [Severity: Medium]
>> This might not be a direct bug, but does exporting this driver-level callback
>> violate the MFD subsystem API guidelines?
>>
>> The MFD architectural guidelines specify that sibling or parent/child drivers
>> should not use inter-driver callbacks. Instead of providing direct callbacks,
>> child drivers should retrieve parent data using standard APIs and interact
>> via standard subsystems like regmap.
>>
>> Could this be refactored to align with the standard subsystem APIs rather
>> than continuing to use this architectural pattern?
A question here: exporting driver-level symbols is fairly common across
many MFD drivers. Is this report's guidance (that all inter-driver
callbacks should go through standard subsystems like regmap) a hard rule,
or a suggestion? If it is reasonable for this driver, I'm happy to refactor
it in a follow-up series.
>
> [Severity: High]
> This patch successfully fixes a hardware desynchronization flaw for
> controller commands above by switching to wait_for_completion_timeout(),
> but the engine command wait in loongson_se_send_engine_cmd() is left as
> wait_for_completion_interruptible().
>
> If wait_for_completion_interruptible() is interrupted by a signal, it returns
> -ERESTARTSYS without stopping the hardware engine, and the hardware continues
> performing DMA operations.
>
> Could this cause a race condition where an unprivileged user-space process
> sending a TPM command receives a signal (e.g., SIGINT), aborting the wait?
> When the TPM core releases its mutex, the application could immediately issue
> a new command:
>
> drivers/char/tpm/tpm_loongson.c:tpm_loongson_send() {
>     ...
>     cmd->data_len = count;
>     memcpy(tpm_engine->data_buffer, buf, count);
>
>     return loongson_se_send_engine_cmd(tpm_engine);
> }
>
> This would overwrite engine->data_buffer and engine->command while the
> hardware is still processing the previous request.
>
> Can this easily triggerable path lead to DMA stream corruption and hardware
> wedging? Should loongson_se_send_engine_cmd() also use a bounded
> non-interruptible wait?
Agreed there is a real race here, but I don't think switching the engine
wait to a bounded non-interruptible wait is the right fix. Even with a
timeout, the hardware may still be running DMA when the wait expires, and a
subsequent command from the application can then overwrite the buffers while
the engine is still processing the previous request. I think the proper fix
belongs in the TPM driver: use two separate buffers for send and receive so
a new command cannot clobber the in-flight one. I'll address this in a
follow-up series.
>
>>  	/*
>>  	 * After engine initialization, the controller already knows
>>  	 * where to obtain engine commands from. Now all we need to
>>  	 * do is notify the controller that the engine needs to be started.
>>  	 */
>> -	int err = loongson_se_poll(engine->se, BIT(engine->id));
>> -
>> +	err = loongson_se_poll(engine->se, BIT(engine->id));
>>  	if (err)
>>  		return err;
>>  
>> @@ -92,12 +136,17 @@ EXPORT_SYMBOL_GPL(loongson_se_send_engine_cmd);
>>  struct loongson_se_engine *loongson_se_init_engine(struct device *dev, int id)
>>  {
>>  	struct loongson_se *se = dev_get_drvdata(dev);
>> -	struct loongson_se_engine *engine = &se->engines[id];
>> -	struct loongson_se_controller_cmd cmd;
>> +	struct loongson_se_engine *engine;
>> +	struct loongson_se_controller_cmd cmd = {0};
> [Severity: Medium]
> Does the use of this bespoke accessor function also conflict with the MFD API
> guidelines?
>
> The MFD subsystem architectural guidelines prohibit writing bespoke accessors
> or helper functions in the parent MFD driver to pass state to child devices.
> Child drivers should retrieve parent data directly using standard APIs like
> dev_get_drvdata(pdev->dev.parent) and initialize their own resources.
>
> Could this be refactored so child devices directly handle their own
> initialization instead of relying on the parent to export this custom helper?

This follows a similar logic to the issue mentioned above.

Thanks,

Qunqin

>> +
>> +	/* Engine 0 does not exist and its data buffer is reused for commands */
>> +	if (id <= 0 || id >= SE_ENGINE_MAX)
>> +		return NULL;
>> +

