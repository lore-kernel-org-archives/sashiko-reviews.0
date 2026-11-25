Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.27.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596471;
	b=oInmNJrRBTvZ9Jyn2SafD5bGC0PE4LONITBzPSSlLvjOh6DWw+81fF1lwnpu4u+LD7BM
	 IDsKW0ZeXAXefgGzOLJdd4YuxJI6X5iK1zhSq1qds3P8p487h9sbpB2mHQLD6S9N3T+sm
	 n9OnBLQYLABQfOWLMyO6oXczVcLSUIjkS1EvkHuFX442Dz7NjJLAVdahWiZlMZnFMe4OR
	 GfuOH9XuT3rzRYmD0GMcERmR8Z0Z1VyiBjpkKSXAMZY30Z5g5XqW2YLsBuVTs0D//u7Mc
	 tRf2k/fE53ZcbkNSRfciu9+qP4jiAGyLwEOueXYUDSzvIqzpwybQV8FuU/GJeCnQENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596471;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 X-Virus-Scanned:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID:X-SES-Outgoing;
	bh=yxLIuGBihVeEzQJjlkm1JeQmw+UYZy0BSMqt6H8/K+8=;
	b=mo5w09w7q+pZY1csw/0H0SyF7lP2bbZ7GwB3Iek936XgqbU2vS6y9881gvbWCcOJzEB/
	 FhZGrUlhxdU2HKrTvQ7sNw6RBQJt6jJFDP1SuVctWzvuV+XB4Q3ITO9RQ+sEmAYFB18dh
	 xwf+HyWkOplvgUUifmrpDITsovARwx5CdqPOwt8AoHohhrK5RBJTT7UEuCFZvJC5yNvlL
	 2U6Ujfaf5z1ECMrQQPcEfvAqsb8Z/Xp2rCixmPZmXTlPGAjCKZ6OvwrLOSoY7g+vUhs9A
	 ayW3KBosZYa0MHMD86Qn3WFSnb5/ntor8bnkNpyI6N7bgbqYEAabCxPdW/kkzQcskwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=retsim.com;
	spf=pass smtp.mailfrom=us-west-2.amazonses.com;
	dkim=pass header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=UX0B47an;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=edMscYTI;
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b=DQqf6kmE;
	arc=none smtp.remote-ip=54.240.27.35
Received: from a27-35.smtp-out.us-west-2.amazonses.com (a27-35.smtp-out.us-west-2.amazonses.com [54.240.27.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DD606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=retsim.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=UX0B47an;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=edMscYTI;
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b=DQqf6kmE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=abaygg6onarqet2uti4t4yyiczbpngnf; d=retsim.com; t=1795596470;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:Content-Transfer-Encoding;
	bh=d/yl+vck61lXSmVP41IN7VueHC4X7NY9GxB6VsCVKOQ=;
	b=UX0B47an3adqnf1UfE7LyXj6+yl+bQmf/GZgDF1lIGqjzlDeQz5vEOYSbWyov/Yw
	gHkv8Z0mgk1YfLjx1K2ANb/HcwAsstXppmqCIff9r/vw0OmywBrdKf86bvRBpTT89JB
	srkA30oMSIjJtpTmzyQM62oAf3vcVwbXYp54mjJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795596470;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=d/yl+vck61lXSmVP41IN7VueHC4X7NY9GxB6VsCVKOQ=;
	b=edMscYTIUUmR4NhB4V1iqytYjqqx1CuJcwlxD72oRRZB01Cvc336XIUIllvaJXqX
	LRLpi3skkkBdkaSp+H9y4DACTrn25uOHNQtM37vT/U7lIm8FG5zHxdiENrqsfDJhE/q
	zTHj9ku1KgITlY1wScInOEEVPQv/5P1tI4aq7lRE=
Authentication-Results: mailserver.retsim.com (amavis); dkim=pass
 reason="pass (just generated, assumed good)" header.d=retsim.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retsim.com; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1795596466; x=1798188467; bh=d/yl+vck61lXSmVP41IN7VueHC4
	X7NY9GxB6VsCVKOQ=; b=DQqf6kmE2u5TgsWdtSrRjS6VsksRTlC+EC1CnNrNKCt
	Cu8g3Nx24eayB0Dxr6zUiDYfGzA81pOpndZzHmq8OpiBhXwQ+grBLbLdw9YDFs59
	q7KW04GCHp7W97IhM/u4vravxNvmyUAyP8Gd68aQN6WJjyq96UQh5kWdCcRlIpF4
	+CQ6cfWrmdlgtR1WOseuTH07kgr8Q0ioi9uqLfsL4rT0L8fdfSRBrwWDcd8wW4bF
	YwExgAV5isqEH9VYdIXnzl2B75mok0kJZS3kCRmoiiMYBMMz1iIfoHsWJS1tfHU3
	Vn2f6RBPHTAj3PGueuOOdvOO4Ml+zb9wNPgcHBE2GiQ==
X-Virus-Scanned: Debian amavis at 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 08:47:50 +0000
From: lewis@retsim.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/imagination: guard fence release against device
 removal
In-Reply-To: <sashiko-outbox-232926@kernel.org>
References: <20261125082637.2839673-1-lewis@retsim.com>
 <010101a211d07983-72e5379a-adfd-4134-b23d-3e2b1422bc2e-000000@us-west-2.amazonses.com>
 <sashiko-outbox-232926@kernel.org>
User-Agent: Roundcube Webmail
Message-ID: <010101a211e3c71d-84cf5be0-7b5c-494e-8652-59d9b556a110-000000@us-west-2.amazonses.com>
X-Sender: lewis@retsim.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.us-west-2.jZ+gdeR9TqNTaB6Dq50UPG8S0IjuYZETsFsi7SlhF6Q=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.35

Yes, that leak (including the drm_gpuvm -> drm_dev_put() reference on
pvr_dev, and on pvr_device_lost() as well as pvr_remove()) is
intentional here.

pvr_queue_fence_release() runs under rcu_read_lock(), and
pvr_context_release() tears down FW objects against kernel_vm_ctx and
fw_mm, which pvr_remove() -> pvr_device_fini() destroys after
drm_dev_unplug().  Avoiding the leak cleanly requires moving device
teardown to drmm_ / refcounted lifetime (noted in [PATCH 0/2]), which
was left out so these use-after-free fixes remain minimal and
backportable.

On 2026-11-25 19:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/imagination: context and drm_device leak in
>   pvr_queue_fence_release()
> --
> 
> commit 98562e29f0071aecadfba68150e688168073f7c8
> Author: Lewis Lakerink <lewis@retsim.com>
> 
> drm/imagination: guard fence release against device removal
> 
> This commit guards work queueing in pvr_queue_fence_release() with
> drm_dev_enter(), freeing the fence directly and skipping 
> pvr_context_put()
> when the device is unplugged.
> 
>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c 
>> b/drivers/gpu/drm/imagination/pvr_queue.c
>> index 34b826381aa2b..2a6bfb090fadd 100644
>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> [ ... ]
>> @@ -122,8 +123,19 @@ static void pvr_queue_fence_release(struct 
>> dma_fence *f)
>>  {
>>  	struct pvr_queue_fence *fence = container_of(f, struct 
>> pvr_queue_fence, base);
>>  	struct pvr_device *pvr_dev = fence->queue->ctx->pvr_dev;
>> +	int idx;
>> 
>> -	queue_work(pvr_dev->sched_wq, &fence->release_work);
>> +	/*
>> +	 * Fences held by drm_syncobj are released in drm_file_free() before
>> +	 * postclose. After unplug, sched_wq and kernel_vm_ctx may already 
>> be
>> +	 * torn down; free the fence directly and leak the context 
>> reference.
>> +	 */
>> +	if (drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
>> +		queue_work(pvr_dev->sched_wq, &fence->release_work);
>> +		drm_dev_exit(idx);
>> +	} else {
>> +		dma_fence_free(&fence->base);
>> +	}
>>  }
> 
> [Severity: High]
> Does leaking the fence->queue->ctx reference here also permanently leak
> pvr_dev and trigger teardown warnings?
> 
> drm_dev_unplug() is called not only during pvr_remove(), but also at
> runtime when a GPU reset or MMU flush fails:
> 
> drivers/gpu/drm/imagination/pvr_power.c:pvr_device_lost() {
> 	if (!pvr_dev->lost) {
> 		pvr_dev->lost = true;
> 		drm_dev_unplug(from_pvr_device(pvr_dev));
> 	}
> }
> 
> Once unplugged, dropping the context reference in the else branch 
> prevents
> pvr_context_release() from ever running. That leaves the context in
> pvr_dev->ctx_ids and its firmware objects in fw_objs.list and 
> fw_dev->fw_mm
> (triggering WARN_ONs in pvr_fw_fini() and pvr_context_device_fini()), 
> and
> never drops ctx->vm_ctx, whose drm_gpuvm manager and GEM objects hold
> drm_device references that prevent drm_dev_release() from freeing 
> pvr_dev.
