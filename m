Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190996;
	b=c2wAPEp7Vj3ybAwv0gczWhmOJK2JsDeqFgdnxOADihjYJXFoLHqZuhdB+GO5A+Whf+RO
	 dH/1ETZbqFReo6SIrDRTcK9qI/V9Lo1HiKhJhnpu3JpKgKCwENjJz7+6n+gZwAog7+ws5
	 QMdKG0mryGj7prGcaF8bGKq0qTIl8Ml2O+PoOzZK26f4cx6V5bAVrq1TBNvF7x70ENZA+
	 Mf6pJdkHLCnawSCN4FJA856Du0ipTxy2eEYp/5163hfk/IRRX/VrwYymY72qYrJVAmTdp
	 6pn6jiJ1stZQRbfcrk6F1cXw29o/Wumds93KeBscUmDif+KQ+cv117jPfeNpYXL08Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190996;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=616SavEERcf0wLBB3MtaB5Vjvy14ra3RY8LHIRO6Zwc=;
	b=PkjThAeF+1RsDta+gUIJZ+4c/qoCYhMOL5kinGqV6IlJ77Ff7A9vl9yEVhI+cDLcQH4i
	 zRj1QUvDGUHQ6vB7Sn6OicODfEfXyX41SyiE1Kljp87mFmCfuatRXtNQ7pi/N4JFrKVwE
	 o9T3Ru9z+cUZaVMwcGpAgFMJrZTOtt68C9h93bGCIJsiirnEXyc+ZEO7mV9xjj3YfUn08
	 bzBRjeJzTkdux4EjRgwSrx/nBS45POjwGnJFnHdQcQTUPijz7cdCO44YykNtGaccTPhhz
	 bYRRpf6HF28OGvadTSzEbMt50pwvmJ5lXb/NztNYvkQryVFEdqEt1yYuuR/pxOryTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LmCKIUks;
	arc=none smtp.remote-ip=91.218.175.249
Received: from mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5444606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 02:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5444606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LmCKIUks
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5wreqCYW4ZBo70/LRl2EgOAhGbY7eNZsCbsiZu1vgfk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794190993; v=1; x=1794795793;
 b=LmCKIUksH+EMZB4f72UAJXgAgjgT7NMnQ5W+zjriCgiRt6Y1UOF9zwrl3rA6YMamRXPuQPG1
 dzYyZI8xtZaP2CqVT+w9qyqV5DV2fvfya8ZrvcbCEWkD/Q13RDcknTbgaI3VmgnvRMxTyB4cBSn
 wVTbjbJTT9qMWp3PLxFOLxZE=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 68f29b38e50f4bf4;
	Mon, 09 Nov 2026 02:23:12 +0000
X-Mizu-Trace-ID: 68f29b38e50f4bf4
X-Migadu-Flow: FLOW_OUT
Message-ID: <91c8d6b5-9496-4c0f-b81d-ac31fbe2748d@linux.dev>
Date: Mon, 9 Nov 2026 10:22:59 +0800
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
Cc: cui.tao@linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] blktrace: require CAP_SYS_ADMIN for the BLKTRACE ioctls
To: sashiko-reviews@lists.linux.dev
References: <20261106142852.3233950-1-cui.tao@linux.dev>
 <sashiko-outbox-201597@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <sashiko-outbox-201597@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi，

在 2026/11/6 22:39, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] blktrace: missing CAP_SYS_ADMIN check in sg_ioctl_common()
> --
> 
> commit 8392196724a6f06dfb860d63cf54fba3357cc04e
> Author: Tao Cui <cuitao@kylinos.cn>
> 
> blktrace: require CAP_SYS_ADMIN for the BLKTRACE ioctls
> 
> This commit adds a CAP_SYS_ADMIN capability check to blk_trace_ioctl() to
> restrict block tracing ioctls to privileged users.
> 
>> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
>> index 8cd2520b4c99e..c1bf8ca350fee 100644
>> --- a/kernel/trace/blktrace.c
>> +++ b/kernel/trace/blktrace.c
>> @@ -927,6 +927,9 @@ int blk_trace_ioctl(struct block_device *bdev, unsigned cmd, char __user *arg)
>>  	int ret, start = 0;
>>  	char b[BDEVNAME_SIZE];
>>  
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +
>>  	switch (cmd) {
>>  	case BLKTRACESETUP2:
>>  		snprintf(b, sizeof(b), "%pg", bdev);
> 
> [Severity: Medium]
> Does checking CAP_SYS_ADMIN only in blk_trace_ioctl() leave the sg
> passthrough path in sg_ioctl_common() ungated?
> 
> drivers/scsi/sg.c:sg_ioctl_common() {
>     ...
> 	case BLKTRACESETUP:
> 		return blk_trace_setup(sdp->device->request_queue, sdp->name,
> 				       MKDEV(SCSI_GENERIC_MAJOR, sdp->index),
> 				       NULL, p);
> 	case BLKTRACESTART:
> 		return blk_trace_startstop(sdp->device->request_queue, 1);
> 	case BLKTRACESTOP:
> 		return blk_trace_startstop(sdp->device->request_queue, 0);
> 	case BLKTRACETEARDOWN:
> 		return blk_trace_remove(sdp->device->request_queue);
>     ...
> }
> 
> Because sg_ioctl_common() calls blk_trace_setup(), blk_trace_startstop()
> and blk_trace_remove() directly rather than going through
> blk_trace_ioctl(), an unprivileged process with access to an /dev/sg* node
> can still allocate persistent relay buffers and control tracing state on
> the underlying request_queue.
Thanks for catching this.

The sg path is covered by patch 1/7 of the memcg accounting series:
https://lore.kernel.org/all/20261106131829.3228926-2-cui.tao@linux.dev/

Originally these changes were part of a single series.  Since the
blktrace capability check isn't itself a memcg accounting fix, I split
it out into a separate series, but the corresponding sg_ioctl_common()
change remained with the memcg patches.

You're right that the standalone blktrace patch is incomplete by
itself.  I'll fold the sg-side check into the blktrace patch in the
next revision so it is self-contained.

Thanks> 

