Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836250;
	b=o9jx8pyeNsGFNx4mW1PgQdZ9hOCQJ0XntylDUPfb9nVOklgHbj8PigOnumB6ysr5vXYF
	 aPdFlR63uQh/jC+V7Im0s9BSW9piM3wnXAa+CERRZ36IVYlsauvkAhG9NUQsyqL9XTrOJ
	 U+ig7BRNcNolSSsOwlqecVGFmPStglwoW/VDeheGQP3B1+2CV8MLe6gdHvZQjR/QoqVp8
	 31q/4Zo15MNActUoDQCEDClKKzQbhHqMF3a3ykF3b8H0k/hgkZu2khJW0KCnP4A3oWDBM
	 gqJDrzrGDVatEbs7rH8k7Reeufod3pZTd9Wl6dPkf3HddUCUj0Rl7koiLCMWJnMlQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836250;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZLX2FJ8teYpCnQ3RfDTqC7zap37D6OQ9RPoG9fqqkT8=;
	b=U5+CVogm004htp+f5TOLUFPVSPtqdcuN57pQ6J3OJaIoxuNIY8r2yFjxFRdFvbo5n2FI
	 gwoP5AVz7lKRDMgg47uA+h8CenW7vyopFmhlWc/dDsxUKvzQfBAMCC0EXfeCi6CzwiSkL
	 saxNU0QX3UuWLOvkCFUeI1qgYKoTGOoeJrulcmHQhz/Q+PvvC5ug9rFjoFmvRYWOIhIYK
	 44GfaURKOSj+Hk6zlCzSAIDyMbXBWo/Poat8B/qlj87b3RUyCi6/k7Nsjr+vRF3zvKQuo
	 f6mMpChmxiJXE2ZsfU7lm/vbKhcOKLO0n4D83QVWIvQI54jpF/Nn46Wt1/c4DznnLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VyeUJLWI;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D64606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 10:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VyeUJLWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=ZLX2FJ8teYpCnQ3RfDTqC7zap37D6OQ9RPoG9fqqkT8=;
	b=VyeUJLWIZowmFIkrb87raiEk3FSlhuXigOFqwV4Fnr5R/lZ1N3+fkv31bYpJZi
	gYeXbeW432NBpa2aGQYiyqqhblmuoKbZev/kWPhUH1EAFqBy6kCK+mGjtM61A/xc
	YQ/iRDOmx0C11OvBZ0643KzOr/pI8AoUIy/IFFeXBtfvY=
From: Bob Hui <bg9oxa@163.com>
To: linux-sound@vger.kernel.org
Cc: sashiko-reviews@lists.linux.dev, bg9oxa@163.com
Subject: Re: [PATCH 1/2] ASoC: es8328: describe the power-on register values
 in the regmap
Date: Sat, 24 Oct 2026 18:03:57 +0800
Message-ID: <179283623767.21314.9471498417293367893@163.com>
In-Reply-To: <sashiko-outbox-183604@kernel.org>
References: <sashiko-outbox-183604@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXn8CNgtxqNz1_CA--.42446S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45XF4UCr4fAF4rXr47urg_yoW8XrW5pF
	ZxK343Kr4kur4Ikrn7Zr4jvFyruayfta45Cry8Jw47Za15A342yrZ3tF4YyF10krZ5Ka4a
	qrs8X34xCayDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUN_-9UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3g6VA2rcgo7yVQAA3b

Yes, that can happen, and it is a deliberate trade-off rather than
something this patch alone can rule out.

The values are the reset values from the ES8328 datasheet (Revision 1.0,
sections 6.1.1 to 6.3.30).  They are correct whenever the codec has been
through a power cycle, which is the normal case: probe enables the
supplies and the codec comes up in its reset state.

Where the codec is not power cycled - a warm reboot, kexec, or a driver
rebind on a board whose supplies are always on - the cache can describe a
state the hardware is not in.  The driver does not reset the codec at
probe time and so cannot guarantee otherwise.  In those cases the mixer
state that userspace installs (alsactl or UCM) is what brings the codec
back to a usable state.  Without the register cache the same board still
comes up in whatever state it was left in, the only difference is that
the driver reads that state back instead of assuming the reset values.

The suspend/resume path already forces the two back together:
es8328_resume() calls regcache_mark_dirty() and regcache_sync(), so after
the first suspend/resume cycle the hardware matches the cache again.

One thing worth stating explicitly: the driver also binds
"everest,es8388", and the ES8388 comes up with different reset values in
a handful of registers, so on those parts the cached values do not
describe the hardware.  I can split the table per chip if that is
preferred; it needs the device type plumbed through the i2c/spi match
data.

