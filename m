Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099789;
	b=LM/UDcScjhjDqNCc5DFrFy5lQ0uSHHjYwK5u/Vh4NsXeIXxmHc+MdrK9boAN/tdKE0qu
	 adZ0yeJFeX0X93g6wfrbiGyyaFkoVxLVJnuzajLq+DTUFac0x+H9YkQGT5aBwwPDQipEL
	 AwuyPR7pqobdL97XdZjJ0grYXn9mHANMTMfghCa9weC0dnqXECoSgse/F2NIti+AceOny
	 VCrooA4DmSpZ24/S2cAOhj1sVoy9YBUD+h0y9v29ynJkad2E5Qw4hZ7avipSx6WuPI5p2
	 qL6iIzLFKngB4Owkuwd6w0R22wNkJEUZnDUuji5OuQF4qs3kGGdj1+tMww8/UPeRDVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099789;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=vVtBkWkK7zs4jMXWSQ4xXM4N92+j1aNMfI0Zy/p0UKc=;
	b=2JdL7tEoDKcQN/luKMUmxFv3OK/5ekO/62NCkVVmkPVyfBcXPckcHUNLdn7VnpZVqwbu
	 ANQdkUQttRXnnB6YQ8+8gqvVWJB1Vu6xEx56gxE40bx4xCdj3MVpEVeUTvOUlGM4iFs+1
	 GJyUbDUl+UycT1NJpE42JI/NNLVxIkIRs4YQyrlJvouJRV6Nxk/Ymyb9AI2jFQsGu3xSy
	 6C5i0XbpGkJ8RK/G0xbOKONRWJh27CDghaT2/fB6vx/ELkyRwl9j8RwpTfGPhxGCXBU/1
	 fGR0IB01Knqi5uh0nUgEHyDBGy53ZvoH5aAK9yidBAfDuxFeGDrevm+4K2G2oM85G3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF65606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 11:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxTtMIiOBqbMoZAA--.8945S3;
	Tue, 27 Oct 2026 19:16:25 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxmM0GiOBqWqYwAA--.35025S2;
	Tue, 27 Oct 2026 19:16:23 +0800 (CST)
Message-ID: <006f82c9-e689-4ca4-8a5e-cd4cc3e14225@loongson.cn>
Date: Tue, 27 Oct 2026 19:16:20 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dmaengine: loongson: loongson2-apb-cmc-dma: Fix
 cyclic residue wrap NULL dereference
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
 <e094c8dc1d01af2f296457f6c18b5d85ae76905f.1792988985.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-184754@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <sashiko-outbox-184754@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAxmM0GiOBqWqYwAA--.35025S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQENCGrgBnkJzgADs0
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr4kCr47tFy5CF4DAF17CFX_yoW7tr4xpF
	y3Jwn5Wry5Jw4rZFs8ur1rXF1UAFWrJFZ2qw43WrnxWr98Xrn29r1fta1rXayUAr98ur1j
	qrs5u397C3WUGacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URKZXU
	UUUU=



On 2026/10/26 17:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dmaengine: loongson: wrong next_sg check in loongson2_cmc_dma_desc_residue()
> --
> 
> commit d1cdc3886ec73f6a09aef30478b0b2741d57690c
> Author: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap NULL dereference
> 
> This commit updates loongson2_cmc_dma_desc_residue() to check desc->cyclic
> instead of lchan->desc->cyclic when next_sg == 0, and adds a comment
> explaining the cyclic wrap behavior.
> 
>> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> index 2037120b23caa..f090fbe0b8a1e 100644
>> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>> @@ -484,7 +484,19 @@ static size_t loongson2_cmc_dma_desc_residue(struct loongson2_cmc_dma_chan *lcha
>>   	ndtr = loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CNDTR, lchan->id);
>>   	residue = ndtr << width;
>>   
>> -	if (lchan->desc->cyclic && next_sg == 0)
>> +	/*
>> +	 * For a cyclic descriptor that has wrapped (next_sg == 0), the
>> +	 * current period only has the in-flight entry left; the entries
>> +	 * from sg[0] onwards belong to the next period. Adding them would
>> +	 * make residue exceed one period.
>> +	 *
>> +	 * Use desc->cyclic, not lchan->desc->cyclic: this helper is also
>> +	 * reachable with a descriptor that is not lchan->desc, and only
>> +	 * the active-descriptor branch passes lchan->desc today. Keying
>> +	 * the wrap decision on the descriptor being queried keeps the
>> +	 * result correct and avoids depending on lchan->desc being set.
>> +	 */
>> +	if (desc->cyclic && next_sg == 0)
>>   		return residue;
> 
> [Severity: Medium]
> Can an active cyclic descriptor ever reach loongson2_cmc_dma_desc_residue()
> in drivers/dma/loongson/loongson2-apb-cmc-dma.c with next_sg == 0?
> 
> When starting a transfer in loongson2_cmc_dma_start_transfer(), lchan->next_sg
> is set to 0 before configuring sg_req[0] and immediately incremented to 1
> under lchan->vchan.lock:
> 
>      if (lchan->next_sg == lchan->desc->num_sgs)
>          lchan->next_sg = 0;
> 
>      sg_req = &lchan->desc->sg_req[lchan->next_sg];
>      ...
>      lchan->next_sg++;
> 
> Similarly, on cyclic period completion in loongson2_cmc_dma_handle_chan_done(),
> loongson2_cmc_dma_configure_next_sg() wraps lchan->next_sg from
> lchan->desc->num_sgs to 0 to program sg_req[0], and
> loongson2_cmc_dma_handle_chan_done() immediately increments lchan->next_sg to
> 1 under lchan->vchan.lock:
> 
>      if (lchan->desc->cyclic) {
>          vchan_cyclic_callback(&lchan->desc->vdesc);
>          /* LOONGSON2_CMCDMA_CCR_CIRC mode don't need update register */
>          if (lchan->desc->num_sgs == 1)
>              return;
>          loongson2_cmc_dma_configure_next_sg(lchan);
>          lchan->next_sg++;
>      }
> 
> While the final period sg_req[num_sgs - 1] is in flight, lchan->next_sg equals
> desc->num_sgs, so the loop
> 
>      for (i = next_sg; i < desc->num_sgs; i++)
>          residue += desc->sg_req[i].len;
> 
> naturally executes zero iterations. Thus for an active descriptor,
> lchan->next_sg is always in [1, desc->num_sgs] when
> loongson2_cmc_dma_tx_status() queries it under lchan->vchan.lock.
> 
> In this patch, the only caller that passes next_sg == 0 to
> loongson2_cmc_dma_desc_residue() is the else if (vdesc) branch in
> loongson2_cmc_dma_tx_status() for an unstarted queued descriptor on
> vchan.desc_issued:
> 
>      if (lchan->desc && cookie == lchan->desc->vdesc.tx.cookie)
>          state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
>                                                          lchan->next_sg);
>      else if (vdesc)
>          state->residue = loongson2_cmc_dma_desc_residue(lchan,
>                                                          to_lmdma_desc(vdesc), 0);
> 
> With desc->cyclic && next_sg == 0, querying a queued cyclic descriptor (while
> another descriptor is active) returns early before summing desc->sg_req[i].len,
> reporting only the active transfer's ndtr << width.
> 
> Even after the later commit in the series ("dmaengine: loongson:
> loongson2-apb-cmc-dma: Fix residue for queued descriptors") switches the
> else if (vdesc) branch to loongson2_cmc_dma_desc_total_len(),
> loongson2_cmc_dma_desc_residue() is only called for the active descriptor
> lchan->desc with lchan->next_sg in [1, desc->num_sgs]. Doesn't that leave the
> next_sg == 0 check as dead code and the comment describing cyclic wrap and
> non-active descriptors inaccurate?

Yes, an active cyclic descriptor next_sg is never 0.
loongson2_cmc_dma_start_transfer() sets next_sg to 0 and immediately
increments it to 1 before programming sg_req[0], and
loongson2_cmc_dma_configure_next_sg() does the same after wrapping. So
the next_sg == 0 branch is dead code for the active path, and the
existing loop already handles the last period correctly (next_sg ==
num_sgs means zero iterations).

I'm inclined to merge patch-1 and patch-2 because this section of code 
needs to be removed in patch-2, so there's no point in fixing it first 
and then deleting it.
> 
> Also, regarding the commit message description of the NULL dereference when
> lchan->desc == NULL: since vchan_find_desc() searches vchan.desc_issued, and
> both loongson2_cmc_dma_issue_pending() and loongson2_cmc_dma_handle_chan_done()
> immediately start the first descriptor from vchan.desc_issued under
> lchan->vchan.lock, can vchan.desc_issued ever be non-empty while lchan->desc
> is NULL? Should this check and its comment be removed altogether once queued
> descriptors use loongson2_cmc_dma_desc_total_len()?
> 

-- 
Thanks.
Binbin

