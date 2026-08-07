Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D05279DCC
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094787; cv=none; b=VFXY0dkPWIBHVVV3Qa/f4i1smPHrQ/bxa0RWwom7nZZEoPt2ZVZDWeg04Qj/bd6lVXbxlQVwNBtr/graZ7i7xvMIPnerYzIGDhNAbZZ9ZPYGXkPNf0VlfsrJGbVj5FiOPRa90F8o7VuAFXQXYNcXlek9128gCqRAu8vfHfXp7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094787; c=relaxed/simple;
	bh=EX+YCv48pnUpPB6CX8QiTAoOqhlTAHbsillQgnzAIKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nc2+yhDALHbf3aOFHmBpmaBxjivs8ffVoz1OcQsP1+gfLXdIzzcVlc+W7J9SwrqupGjI2BEpSxBVQC6nhXenEHTCc123uWIuaCzytGm22uJCcE5Ow7m7Txpr36oKPbtZkRTrz/HnwppthVa3ApulEFYQBDYoaaUduJtZdUpIJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VAqP5hRT; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VAqP5hRT"
Message-ID: <0b10bb1d-3d74-4aa4-ae57-f8a0462bbd73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786094782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xmDI+1jGZvliNTbr2SWgCPwAukMA1ziPoz/EzBkxu0=;
	b=VAqP5hRTg9wCyhGAYb9Qq6hzBklk35ixnB5PQnz/VPLtRHFy+Zu+89ZQqW1tIIRqLGifXP
	lZ/iYdDTDYSXpgqNRK5tO6HPUvBSuM4Zf4GtD7gqntUTaSEf1JoeMNRQUQ4AHFv06XTjQ2
	QLC1fYTmy/SkD2YuubGfaMA+tJqmZdA=
Date: Fri, 7 Aug 2026 17:26:14 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] memcg: acquire peaks_lock when reading memory.peak
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260807090000.1532495-1-ridong.chen@linux.dev>
 <20260807090000.1532495-2-ridong.chen@linux.dev>
 <20260807091437.082C41F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260807091437.082C41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 8/7/2026 5:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] peak_write() destroys transient peaks for all other watchers by propagating the current usage instead of the old local_watermark.
> --
> 
> --- Patch [1]: [PATCH v2 1/2] memcg: acquire peaks_lock when reading memory.peak ---
> commit 7238a507204c3e18dae7c130c8f9f1da91b169b0
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> memcg: acquire peaks_lock when reading memory.peak
> 
> The commit fixes a race condition where a reader of memory.peak could
> transiently observe a lower peak. It adds peaks_lock acquisition in
> memory_peak_show and swap_peak_show to ensure readers see a consistent
> snapshot of the peak metrics.
> 
> Link: https://sashiko.dev/#/patchset/20260730115314.1069089-1-ridong.chen@linux.dev?part=1
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 6061c0ba923bf..15c65249849e3 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
> 
> [ ... ]
> 
>> @@ -5806,8 +5811,13 @@ static u64 swap_current_read(struct cgroup_subsys_state *css,
>>   static int swap_peak_show(struct seq_file *sf, void *v)
>>   {
>>   	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
>> +	int ret;
>>   
>> -	return peak_show(sf, v, &memcg->swap);
>> +	spin_lock(&memcg->peaks_lock);
>> +	ret = peak_show(sf, v, &memcg->swap);
>> +	spin_unlock(&memcg->peaks_lock);
>> +
>> +	return ret;
>>   }
>>   
>>   static ssize_t swap_peak_write(struct kernfs_open_file *of, char *buf,
> 
> [Severity: High]
> This is a pre-existing issue, but does peak_write() destroy transient peaks
> for other watchers by propagating the current usage instead of the old
> local_watermark?
> 
> Looking at peak_write() in mm/memcontrol.c:
> 
> 	usage = page_counter_read(pc);
> 	WRITE_ONCE(pc->local_watermark, usage);
> 
> 	list_for_each_entry(peer_ctx, watchers, list)
> 		if (usage > peer_ctx->value)
> 			WRITE_ONCE(peer_ctx->value, usage);
> 
> If watcher A resets its peak when usage has dropped, peak_write() uses the
> current lower usage. If watcher B was tracking a previous peak, it seems
> watcher B's value is updated to the current usage rather than the previous
> peak (the old local_watermark).
> 
> For example, if watcher B resets, and then usage spikes to 100 and drops to
> 50, when watcher A resets, peak_write() will see usage is 50. Watcher B's
> value would be updated to 50 instead of 100, and the previous peak of 100
> would be lost.
> 
> Can this cause workload schedulers reading the peak to receive an
> artificially low value, leading them to over-pack workloads?
> 

This is what I am trying to fix with patch 2/2.

-- 
Best regards
Ridong

