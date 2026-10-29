Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.44.14.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301056;
	b=zEPcqrFLN/Uh/Tw2YrTLfh85DzxcwxG99Q67UY8hqWYW5Aes2i+W4+tQr1IaThZpeMeI
	 lGDHl5k4ucILgBPY8G2w9YeN/3O8SoFYMEYZEdGZeY0+0fSl/7u23Xsxir6a0ZOYzhVIN
	 1/wGUGnv1Obx0sph8o/itUpSP2K9/FDutdXkezMBNtvsL9pe2gGkrvK0eP4k53GFZ+SQv
	 bMEKdECpX3c0qOVD0SFhJktkwzgk3YigJy81qLl5++31tdG1UeuLncUeMfJi3+j7Eil8d
	 wIzZmelYdd3BiLI+wTV0TvDtu3Y6UoC/nTFEzlqloQY6ATMvK2nbPo1UDrk/4w+jEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301056;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KK5qYiWjNM7e6CUGue9gPBlhWsuwXmp+cvGAVaU4r+4=;
	b=1C7PS3QRCRjM8fuL4tvUmagEIBhuTpz4hkzEkAMC5JHWBR1gQUVEUUsiOhloRCsMxN3l
	 1cA43Z+cSn70IgTurQjlorRBo93fPJzCylFz4FiLByuy9nxfocomq8/+Qrp7vW9g7jj0Z
	 tJFJLAo3aY1dEdobdpzuyoaKiW7wxlcKFWUr5kkeMnqmQSqLUXF/4D7iXTePzDruSnLpW
	 h5zzHu4lVGOywN9MwIBJdskPgHyOAUMXDGoD8THkQtGxkm9U4xXmYjWzjJPZnO3MA/akJ
	 9+QM7MsxkXadvY90Ki/4HtTbeGrQcGTTrEDPPdYDzhJQ61zrNwSbgz4bl+rtp6idnOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=bhgoxkaP;
	arc=none smtp.remote-ip=31.44.14.20
Received: from forward504d.mail.yandex.net (forward504d.mail.yandex.net [31.44.14.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5D606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 19:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=bhgoxkaP
Received: from mail-nwsmtp-smtp-production-main-94 (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:9cd:0:640:e66:0])
	by forward504d.mail.yandex.net (postfix) with ESMTPS id 808C81003A1;
	Thu, 29 Oct 2026 22:10:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94 with ESMTPSA id QApHFuTduCg0-YLwvWH0r;
	Thu, 29 Oct 2026 22:10:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1793301043; bh=KK5qYiWjNM7e6CUGue9gPBlhWsuwXmp+cvGAVaU4r+4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=bhgoxkaPaj5jZwQq9W0hPhgKFw2RJ620Yx9Adbjt0pdIC6xo2I31nqqOcnRMouzj9
	 DKo7tGrTpXI4urstkYnmZMMRrJJWIsWpDgEm/0olQ+5xHqm++u8KAXwGmgRmiIrec7
	 8mytnG0wLPOiYDEZCI2+Sem3cAWgG8MrNJFoxPqQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-94; dkim=pass header.i=@yandex.ru
From: Kupreenko Danila <keckerz@yandex.ru>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [RFC PATCH 2/3] power: supply: add read-only CW2017 battery monitor
Date: Thu, 29 Oct 2026 22:10:23 +0300
Message-ID: <20261029191023.546957-1-keckerz@yandex.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-189760@kernel.org>
References: <sashiko-outbox-189760@kernel.org>
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

Hi,

Thanks for the review. I reproduced the three effects: a valid unchanged
post-resume sample causes a spurious notification, a first post-resume I2C
error loses the availability notification, and an early thermal TEMP read
returns the synthetic -ENODATA before the poll can refresh the cache.

The proposed fix removes the sample.error assignment and its lock/unlock
pair from cw2017_suspend(). It keeps cancel_delayed_work_sync(), preserves
the last completed sample, and leaves the immediate resume poll unchanged.
That poll can then compare the actual pre/post-suspend states. Real read
errors still invalidate measurements and notify consumers.

This also addresses the comment on PATCH 3/3; no board DTS change is needed.

The regression cases pass with ASan/UBSan and ThreadSanitizer, including
TEMP reads before and during a blocked first post-resume poll. Threaded
workqueue/devres models exercise synchronous cancellation and teardown;
they are not a replacement for kernel runtime stress. ARM64 builds with
PM/thermal enabled, the no-PM object, and sparse also pass.

The early temperature remains a cached reading and can be stale until the
new poll completes. This removes the artificial error; it does not promise
fresh measurements during thermal resume or hide genuine unavailability.
No phone PM test was run, and the tested R4/R5 artifacts are unchanged.

I'll include this fix in v2 of the series, along with any additional changes requested during review.

Thanks,
Danila
