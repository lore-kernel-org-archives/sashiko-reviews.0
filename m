Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818308;
	b=Ze+oTLJ8fTefc6wsbR9mFeAt5WzqPu3AS69ICcLpibSicNM+91Y3WmIgOXvaGy24RwNw
	 2/fS29w/OmFwaypLUya6z3ox6xeeMs40bS7OCt73vD9HxZXNVSfvlBzP88VyD7LyvvD9J
	 NMTnanVSv7zTLwObFEqgY71ep+tAeH1OLPntKfHFXwwx9m07VhOBOH+Cyx6laaNJPx5DY
	 hfmq0imYBkqrBfD2mYL55tfKLYSvv2hmoo+U5KKflEMHqRlYaGOgKuRstfO++ylTRz08K
	 u27sQCUCwi6Txs6qv6nT3XXSdeSGd9XfuCuSxwu+79Yu2l+hmmRiEVWuZuRJVU3DdJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
	b=xANv0sLk6vLDjCRaBkgRwmae1vka2Uhh0mYgT/watiCMGhKpynBkSxcP6KECpLCZFxPe
	 qPf3asicu5tuAH7uxVDWG5fD1nsuI8NBfC2ZHABh0Hc8XqLGXAEpdDj/2smGdiXYJgLIh
	 J+1ul6XC9svxGJLaoxfmbbL+p00joGkc1x/u2vvGKfiAZ3IJ6P9827QksDQgv5HeyOEnr
	 yD9y5NjZLTUPXuW5U0gB4b3Iz1XfYBjp05rjvAJ/yTNUNgBKnup/Uwh2XSREVQscHiroW
	 Khcgw08p+YwM6ad11CmbxVTK4IB6VdTlARHVjs4TooAQHZ8+9XRnTfzvfExdfgXBB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b="WUlcLQf/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1078606EE83
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 18:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1078606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=WUlcLQf/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1912470eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793818307; x=1794423107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
        b=WUlcLQf/ipQD0S9hASRgvNq5qLdWGPc0niw0eSqBvdfpvgPmPfEweKnl0+U2QplxaC
         hU0W1fSYjRarBA0Iy0DjQtSHDhr9noxYBtQzAVTnMCfdxUFd5h54JFXldkDn4ONBQegE
         qTYhsnK0aWf23KCwWFCpJhhvh1ihjUtg1HQk1aP/DsDd2VRUCElvjq1nMn064U7Htxw5
         cZxhIyvso9cAt1BgaPsvSTDKVKDsMBeQdx0zpg/3UP1+WsKsFOlCZlm8cEMk0vDPd/t3
         JNG+SUcy5mGZppucCM0Qrkw2XHwBf1lpweTcWD4eO8VWh4iZOjwZjQG22uhVZ3ghpv73
         mERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818307; x=1794423107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
        b=nmnfCyUVN9lpJ3DWNmmjTIHnWFL/9RJ3dw8qIPYEnEZZ9mN1juS8aKkoz0mp3DjgxL
         S57U6F0AKLmzltvCRPxyywtpVsta2H1c2rYFIUMS+vmvF573FVwZdvSFei/gNGPRM0Sp
         yvaA37PXbiuvdiDUqoeGrZPrCaCWa2VVUeVn+fK2zUvzwQWPlD3JYWzbcyQiHiPjoqLG
         V3HcT2acHm/3jpa+W8RHsIaajiZAmRYnCkMzNcrIDnObvT/Onj05UUprJJFciNJaVuLy
         3bLTafZpqRzZ6pjfof8ahWC69DbZVHHI2VwikjaALU22rHN/nZR131JDbUtAlPsP1PUb
         hKmQ==
X-Gm-Message-State: APuU4Z94YrCVEUgaw3dcZLhn7EBTAf/OrBbX9P/IEl8CPECnyCis+vtJ
	dA2fKbBzgiBowW2/Q5+WCKkRqf6R67i3UggVrjeFeTe7DSbJoAl/S8bUrfV0+nbjB6ZzV4sY3i5
	glztrWVM=
X-Gm-Gg: AYBFou2x2E5fMvTDafPKExSZjoftnbquvSHqDea5T36cGouEV4+cSPMEJbv7KDNuNdl
	qXCZv0Ix8K17LwNRatoHhtDW5i0A13Woic1g2rMvK2MOQGRzPJSW+VqnOtMuWrcoMd0f77j2MN3
	GFmDX8KebWzw0t14AjxWcLerw3PspPviFprz1/gX9YvqRlMaO9/Wh6Ig5RzxhEhvOB2HQNsKd8o
	4RpI9AEjxdpJekrvJSKjYhH6KLm7OeqrUvzuvXtWpOOqOpoqvICmZOq+jUPwvYqNVtt9aRNrrRc
	e+W85FNjS1jYew8fa0jbbBnb+qydvEq+jruat6VGSjLnwAd6JFPcXbJnxJa+huTxy5zh2+itsa0
	+5GyNDtzWMEzJ3phpX6uoi67TfqgMV3qhy255FDQlwZSrhzmj9fTLGGQtr8/7mBzbXC620HqW5L
	RXm4slSIA++KWv9dmPM3f9v+1yjZHbyRI4azC2yXr+neeEewBYV/f9T2rjk4KuyKw2c/tmSmOZC
	fJnrIgqRe1zCq7QTwfgufVmEjY31hlZdvrDWodhSJDftjTDQPJ+06MG+h9ZqFoLEnX4IEgtLCAr
	ScpMWirYPl7baTosEmDwzx/WdhPp81IDTcB0P7D7/HvxaX2F1caSq9vIDv+tMFo7UUTRZdvtEbU
	=
X-Received: by 2002:a05:7301:6498:b0:36d:bf43:93ee with SMTP id 5a478bee46e88-36dbf52d6cdmr849344eec.28.1793818306527;
        Wed, 04 Nov 2026 10:51:46 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm12193389eec.23.2026.11.04.10.51.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 10:51:46 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: sashiko-reviews@lists.linux.dev
Cc: Saravanan D <saravanand@crusoe.ai>,
	sashiko-bot@kernel.org,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai
Subject: Re: [PATCH v7 1/2] nvme: add per-queue sysfs directories
Date: Wed,  4 Nov 2026 10:51:25 -0800
Message-ID: <20261104185131.92361-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-197419@kernel.org>
References: <cover.1793800758.git.saravanand@crusoe.ai> <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai> <sashiko-outbox-197419@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 02:17:33PM +0000, sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> If sysfs_create_groups() fails in nvme_add_queue_info() after
> kobject_init_and_add() has already published qinfo->kobj in sysfs,
> should the error path call kobject_del(&qinfo->kobj) before
> kobject_put(&qinfo->kobj), just like nvme_remove_queue_info() does?

I'm surprised this sequence went unnoticed in the previous versions of
this patch, since the error path has not changed since v5. My fault
injection runs used DEBUG_KOBJECT_RELEASE, which would have exposed the
directory left behind, but they set fail-nth on the task writing to
/dev/nvme-fabrics, and fail-nth only fails allocations made by that
task. nvme_tcp_setup_io_queues() starts each I/O queue from an async
worker, so nvme_add_queue_info() runs in a different task and none of
its allocations failed.

I will send a v8 that calls kobject_del() before kobject_put() once
kobject_init_and_add() has succeeded, so a failed sysfs_create_groups()
unlinks the <qid> directory before nvme_add_queue_info() returns, the
same way nvme_remove_queue_info() does.

I have also extended my own testing with a run that uses the failslab
stack filter to fail each allocation under nvme_add_queue_info() in
turn, including those made from the async workers. It checks that a
failed add leaves no queues/<qid> directory behind and that a controller
reset can add the same qid again. It fails on v7 and passes with the
fix.

Thanks,
Saravanan D.
