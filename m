Received: from firebrick.ash.relay.mailchannels.net (firebrick.ash.relay.mailchannels.net [23.83.222.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA1544D55
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.222.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183383; cv=none; b=Vj8CBYqJoT3jUJagHYpx9TFLKHnpYMPUjTc92NjYyyZ+QNImjdxffj0Fbhzt7LCi/gcUKAQggowacYjrg7W7/uBXH9CO5nJB+AHMuEh1Ilu4etJqf3WwP8fN5dub6lFQiVmOKtIq0mwmqXgcZfNjolNckrZZnGyhB5+3VUn6NVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183383; c=relaxed/simple;
	bh=ODnfCzQCMRdqJrF3lC1kMqiFG9xBT/eY/DQltG3A9xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGJAeqGc8QUd0FuDk9aamlx0vxo6s3AftQhCY8v9hZPFl6ntiQZSCbfJHUH6H0Q0PCSX4Tc/hUXgm+7G+aWMmt+AlpIfR5s1ZmE+uBmkN2H9yLzrdeibvyR1E9k0hFI7ShQwaod7JuThWvzEK41w/C6dP3X4xRnecX91up1gHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=XZLoThng; arc=none smtp.client-ip=23.83.222.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="XZLoThng"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 66F237A262E;
	Wed, 23 Sep 2026 17:00:30 +0000 (UTC)
Received: from pdx1-sub0-mail-a253.dreamhost.com (100-100-64-102.trex-nlb.outbound.svc.cluster.local [100.100.64.102])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id CB7EC7A052B;
	Wed, 23 Sep 2026 17:00:29 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Harbor-Share: 04761f7460f5116f_1790182830185_3483328357
X-MC-Loop-Signature: 1790182830185:2206886135
X-MC-Ingress-Time: 1790182830185
Received: from pdx1-sub0-mail-a253.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.64.102 (trex/8.0.2);
	Wed, 23 Sep 2026 17:00:30 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a253.dreamhost.com (Postfix) with ESMTPSA id 4hqjrs2rsXz101l;
	Wed, 23 Sep 2026 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790182829;
	bh=tXWaak47gRKxaMrdH9l0Zy9r1HEhDEc/fZn+u/4whQE=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=XZLoThngjo8Si4onXok9xw+SpHrnyQTNKzEp7BNfYvTIEqpzTm3R8f4xKCtss6klC
	 r0q5xzJZzuAhDdZk22W7pSuoYj9osL1io5pCFvcmpU0UfZcsYeYRf3UxcnWex4YLdB
	 L5eB3+8pMv/JbJCg12/tP9KxP5B+d+UITMBL10v0utAJsmhQQd2goJvI2aw+vZIb49
	 i3B/xEfKxYQtiYXnFaeX8YW9A7tqTB6vOS8FxFBkA8Uyo6NtJBI4QXhr+ZeYtAZlYd
	 orRxSvKLheH6czwTgteqVpP7o2dzn6Sx00jb0rEZKLBmDJIzEfZGQ+kGYvHp42sfdd
	 lPFWlMIBnYfrA==
Date: Wed, 23 Sep 2026 10:00:26 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: sashiko-reviews@lists.linux.dev, dave.jiang@intel.com
Cc: linux-cxl@vger.kernel.org
Subject: Re: [PATCH v9 02/10] cxl/pci: Add BI topology enable/disable
Message-ID: <20260923170026.6tpxbrgsbqa2zplr@offworld>
References: <cover.1790103847.git.dave@stgolabs.net>
 <d87ff01d77dacc7c0a0d20aaebb1ce906c968b91.1790103847.git.dave@stgolabs.net>
 <20260923011241.4B9451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260923011241.4B9451F000FF@smtp.kernel.org>
User-Agent: NeoMutt/20220429

On Wed, 23 Sep 2026, sashiko-bot@kernel.org wrote:

>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] cxl/pci: TOCTOU race in BI setup against concurrent AER reset

False positive, see below.

>--
>
>commit 1daa4037cbac0ebc16630c3d4f45c358bd7890f9
>Author: Davidlohr Bueso <dave@stgolabs.net>
>
>cxl/pci: Add BI topology enable/disable
>
>This patch implements setup and teardown of the Back-Invalidate (BI) topology
>on CXL endpoints and upstream components. It also adds a reset detection
>mechanism to verify whether a reset cleared the hardware BI Enable state.
>
>> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
>> index b8676a3d6ec90..f3ca9861a7ba1 100644
>> --- a/drivers/cxl/core/pci.c
>> +++ b/drivers/cxl/core/pci.c
>[ ... ]
>> +static int __cxl_bi_ctrl_endpoint(struct cxl_dev_state *cxlds, bool enable)
>> +{
>[ ... ]
>> +	FIELD_MODIFY(CXL_BI_DECODER_CTRL_BI_ENABLE, &ctrl, enable);
>> +	writel(ctrl, bi + CXL_BI_DECODER_CTRL_OFFSET);
>> +	cxlds->bi = enable;
>
>[Severity: Medium]
>Could this lockless update of cxlds->bi race with a concurrent AER reset
>handled by cxl_bi_reset_detected()?
>
>If a user manually binds the cxl_port driver via sysfs concurrently with a
>PCI AER reset (SBR), the manual sysfs bind takes the endpoint->dev lock,
>while the AER recovery (cxl_reset_done()) takes the cxlmd->dev lock, allowing
>them to execute concurrently.

The endpoint port cannot be bound on its own. Unbinding it from cxl_port
tears it down through cxl_detach_ep() and a subsequent sysfs bind fails
with -ENODEV. The only path that reaches __cxl_bi_ctrl_endpoint(enable) is
the endpoint port probe, and that runs synchronously from
devm_cxl_add_endpoint().

The driver core holds device_lock(&cxlmd->dev) across cxl_mem_probe(), and
cxl_reset_done() takes that same lock before calling
cxl_bi_reset_detected(). The reset side therefore cannot observe the
window between the writel() and the cxlds->bi store; it waits for the
probe to return and only then compares the flag against the hardware bit.

>
>There is a window between the writel() that sets the hardware bit and the
>assignment of cxlds->bi. If the AER SBR wipes the hardware bit in this window,
>could cxl_bi_reset_detected() check the still-false cxlds->bi and ignore the
>reset?

I widened the window with a 4s msleep() between the writel() and the store,
rebinded mem0 and issued an SBR through sysfs while the probe was sleeping
in that window:

   [16.846] cxl_pci 0000:0d:00.0: reset via cxl_bus
   [19.290] cxl_pci 0000:0d:00.0: BI requests enabled
   [19.335] cxl_mem mem0: probe: 0
   [19.337] cxl_pci 0000:0d:00.0: BI disabled by reset

The SBR itself lands in the window and clears BI Enable, but the reset
write blocks on the memdev lock until the probe completes. .reset_done then
runs, sees cxlds->bi set with the hardware bit clear, and clears the flag.
A subsequent HDM-DB attach is refused with "BI not enabled on device". The
software state does not desynchronize.

Independently of this, patch 4 re-reads BI Enable after committing each
endpoint decoder, so a stale flag could not commit a decoder with BI on a
device whose BI Enable is clear.

Thanks,
Davidlohr
