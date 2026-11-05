Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889796;
	b=0/Ab1HMFpyZqLYB6/vpzKHIZIv2DGheABmj10XgJTjvdqozJEMTrdzd7tRn49SYc5hBA
	 SiSvVG1d9XLjChszo5B2u/9BZbXlipLmVeCFn5bTHpNCoBxbqcP3nN/5XhaxTXCOt/DTc
	 c/KhVaVSuQ3fCtWl4y89t69MAZ1tdEDRd3Vi6e4MrieyE5CMxIo1XoNoZ7q5U8D1xMGHt
	 /VlRiVU6X9KUrwAcTRK/XgpwpAWvy4mNPy+ZHZ5RC9erMZaw/xTsVzMiyid1RmGEPV9PA
	 mBHL3QzxcboYa1R4DDpt4HJjBDIGHQiib0Mvhkfv+xatPx7F2HpYBRDutUAv2dHPfwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
	b=hoZIkHh9Sh/gtVZ0EzkObqVhw+c3yO+VHv+nzNd6c6s2qATv/AZkr8j1C9RNshkXwigD
	 PV05sOa6YDNQBdJxxba1WtDWlmRbv67CK5UBlgZ11QX9yvqzWJOptHuxc4lY2jsdq/aFQ
	 eFEjF9YEhpEB3e7q/D4mA8vbI2mTumKuZiF/kB1xZTuoLVGChwf1SI4ZKQsjGp9M3lLY7
	 5V7IU4NBFHwT4bxnBKcC/7OPrjE/99SZsR+bEs36t40kl6k+f7yLvZHLUVKY+2LGecSNj
	 gGiq83xL3abJnVKBay344Y7qxWVbgTMy8VZvTq2/lOuqtTeSqLKwvxxq/A2rp/PeRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+3wJ9iS;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87849606A337
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87849606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+3wJ9iS
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4374134c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793889796; x=1794494596; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
        b=f+3wJ9iSw22Vb2eAJkv9X6bCd6LOY3P4QH+F919WxZqOIxAD48y0EJOTFu6niQGyEo
         KQyR7ZoiOWCD03nMQMLJh6AOOZz+g7aqnqktmFclfLZii6Z9khnLswSabyCrQvydhwTi
         FoIYw+K4KhwPYZlL2AgRxcoKV6HnrJ5zRh+JS/dCPtbo3gF6OtZS1VdHOVe1Tu/S+ZcV
         HjAp7zu49j4xuEI89oyKx2n24uOMIAYlNrIF7OP5PkebfVNpfHzN+usCKBqfyNonQTTn
         iXyLCyAKgVrhMt78xqy3nzCBwzVtiJj7gyJdKA5Ve0iZQRgougxLo+2H3yLi6etlB1W8
         XyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889796; x=1794494596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnyLKUfg5ufAqKiT0oKE83kexAXeCPTLKjrnMiWI+IU=;
        b=gih9ZYMcoRuXCWF9VND0Nwr5cdvdp2cz6wWc201dh1Ade6gE0/p54E8wAfcwq9bV87
         2pVqACGMB8z0ydx5KUrqMZIkEzc8VbnVVDU9W4xeZt+NRwKpSF5FfI/fZgP7AmaV58Pf
         ThyrQURgyz3DQzgfyuP/3PkS+Lhg3rxwi0MpF51D459TySDAhdbc7ZxGZCVhKE0ZHnL6
         t/W+QNj9eF1n2pDIlMQ82zZ53E46wR4sFHnshW9s1sgT77X7fu0/r50q79L8R44OIFn4
         zUhKEoxBpKsdSRr94Kyjqitj9Hdh4kG0TBHZntUEMyPCFbd593cIpfbPvt3kluBbQbDh
         6nsw==
X-Gm-Message-State: APuU4Z+AYLCdAnh1E1Dzs++WMZNZQMwuH5MJgpQuIxIDf/CYxxx2u6GZ
	wekWuGT7/cOOgb9Eq7xwMJtkMXm+MXJpPpRC6eafIvszHSpspcJdgWiPHe9X97XpXFkPaxVbrxj
	rxIjeA411l4jYoVxyMkyuLXYFhU3wCN9qNXunAhSpAM0kZYogtE/ioWMakkYCxrXBL7zR0hSmp9
	Cf5M97etM0FACAt1yOgl+dR8ySHHYMsaRTGjSliwpI6yx/Nr9I7BYogsdcGn5Q4z1/qLcgmA==
X-Received: from dldz11-n1.prod.google.com ([2002:a05:701b:418b:10b0:1a1:3ce6:560b])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b047:20b0:1a3:bfb6:44ad with SMTP id a92af1059eb24-1ac5da797d4mr31199827c88.32.1793889795206;
 Thu, 05 Nov 2026 06:43:15 -0800 (PST)
Date: Thu,  5 Nov 2026 22:43:13 +0800
In-Reply-To: <sashiko-outbox-198693@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105071518.1458428-1-stanleyjhu@google.com>
 <20261105071518.1458428-3-stanleyjhu@google.com> <sashiko-outbox-198693@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105144313.2627198-1-stanleyjhu@google.com>
Subject: Re: [PATCH 2/2] scsi: ufs: core: Wake consumer queues on suspended
 W-LUN recovery
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Brian Norris <briannorris@chromium.org>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	John Garry <john.garry@linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 05, 2026 at 07:43:05AM +0000, sashiko-bot@kernel.org wrote:
> Can leaving ufs_device_wlun in RPM_SUSPENDED here cause hba->dev to
> prematurely runtime-suspend before the asynchronous consumer resume work runs?

Agreed. This will be fixed in v2.

> Wouldn't that leave resume_sdev_queues false and
> leave the consumer queue stuck in __bio_queue_enter()?

Agreed. This will also be fixed in v2.
