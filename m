Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457967;
	b=5q/03MTTlMKMGwEOc1W1AB8wm3kktf1v9OseOazM3nxj7Sr9YHZvJcqTZU3PBs3R/iI3
	 08TNNoWpjS8elljlMZdDz1raeJFnZPPbpqa2uyp+TVTUu2TXfXiMm/Jd8a4JFqbRqE8r/
	 IKcBtpg008LEqqH+6/GX+C3fbg6a0TjfRR8fQTtPqRwDMa+veyXPPthdDvDJpgGOYor1B
	 x2RblqS64t+1pO7U6PX+uJKWD02BuUF8NTCR/KVmf8TC6M+GmDlDPza8O7C8EG8Glwu7C
	 JOqw+x/b9YkGb4VVBV6IgZ3oYoXjWBcPSXSQ8JfWmDoCoVLlZPVEI9WbXI9aOVf2zag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
	b=jB6GUbg0sr4CKjExck5yulUvLAATNyJzHXncSXcQ6yler5jgN9qD47aJtmFSXKwuA0aP
	 vRT6mVD+eE0f156KRa7n80DN7ES0906Jhy80AAW0Km4z4INU1ciWvoOQ6cGlo6FZ6qlw7
	 rVn0L/G0K47vr4jceNQWGUyZYGG0jYjN2PVRnuzYxxRSjngE2oWaiDEkPlP4hLsdTpN7X
	 doWjujbbWbSbw/GlQaZMVHTsXJiK6HKoyKRBjQqeUvgvb3qYPTTeSQIxRC3TAoTtjhEBI
	 X6JivcbeMsheyEXY1hYyToXYgukwp7X5bBIfPkUjDM57VrK+vhxAhrN02biWTR8dKbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8KF7Gq2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A2606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661A2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8KF7Gq2
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04b676219so18793065ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 10:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457967; cv=none;
        d=google.com; s=arc-20260327;
        b=UYZO1uL+lP02bOWOrPXSQ668Oe+hrYdbpA4VHG+DYKdYnen3X8/ghrErFY2HkC/XbK
         VCsSu3iT9iKaDBjP5bMnWA9go0jY9eicKM6sjP5dOlp3YWIuYDE1hWH5ABT1/7/1s/og
         wA1doboUPYQ0C2ngHr3nE308CZrCz3ZMo4pcKJDhREfV5BU0wvni/wyRugDgDxNNcQFJ
         D5Ahb0c/fjfHrrXQcfgukhKeE+xG22d35O3uYeU3y/DjXQmUMZttNVLYE0c+U5GeKSV9
         6C1i9xnxBj7CBRf7G/ok1JxNKT2gWx3SVoTyweu9wF2vR5jN1caqRfFGX63aQ4QlW4Bw
         IyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        fh=SuiltkwtxYE7Na9ace6CsKk/YKXYDVV3zbS1EHenti0=;
        b=ocKa+cdEWD7mHtJOQ0+iFinMB7Fh9KZbxEg71ujp/NnHxD5cEwRzLeWaVmUTtQaU8M
         WLjMoY5ZT2VFLnThptIlhivgUlkTX7aRJM4EB/L97UbPxdRORyN13R7QBDFI18H4j3Pn
         Bm/M4KRupen8xHrrLjKXGoFreRqU+jZ+Aym407+8Cip3sUYV8suusyoMrOPHliJGE4hk
         tSbTCzks2ZOSGzCdeQ9sBM8W4anOrUYXcefnhbZw0M/NYKXkquU+ic85pjBLe7t5zKD9
         IjH+A5BVWL1BhnuWNXvBxtPV279O2yogONkzPqvF7mHS6my9LUrcC2l/IfzQAWPJmKfO
         qYVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457967; x=1796062767; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        b=W8KF7Gq2tCjSkWFlMwZJ6heenUGaZruGgnPGnLMLNA538isYHeexVwtfATmahOPjqt
         Z5VTjkSXTnqUGMJ7dctzLbyX70IwN0XxTgcUIjSeCR9Cg5NsRy9y60J85XQFac1NX2cf
         wc5uYWeHrblBQV+v8FmQg6J0Ue2aU6K8ZAUSa6GxF6OBHzHM16bMANVavbXRzd3ZOtm4
         +eEc8t7qxMSNyxj335tSkpsu7atDh+FS2wAuJo/tyVaE0DiS25kI04He1axUp/5GcZKU
         9kFe0c05WbFxsx1mIkgLFTk1Xsotp1fMjgjykCs38VypEMcjfmr2fgXIncnrXo0p1I14
         w2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457967; x=1796062767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w/35+OKTYeKSrDPcP1f5IU7EdP2ctykP8aw1CQHX1hQ=;
        b=COhN0zGCVat7SE5xE+/uvNkeD2rgYlvzB/sBfmy4kjD+GW0+hg/2i6T16EiqofZFHx
         EXGU0P3SlhmRPbP7FF7rPO2wP8/X/TFzxNn5IyyWPzqJf0I+WZagfB1opBs4R0kT7QEp
         gk6i36OTD0xI4bgQa2spb4vKzoTqJJ9CGlS551AONjFJw2bLQttp57Npab7UzQJlJMgL
         3K538nMQ1pC23iuFY8Dze0Tvbd9yAM03b/qfhYo+2HZfVhpVI6N72UpUVviTfFiEDLn9
         M9S+tDIVXYo1Nb2AE8mhFr752grD81zq7Q2fEXp5Nw5cjGWl0zzVPRkIgK28V2xicY2N
         7NeA==
X-Gm-Message-State: APuU4Z9sDFU4BiWTxfLm45sShmLc/XyPUkq2sHcTQI0ZeIg+nv40FUrk
	3v4l1PLD4Qdi9gGp3Ur3zE2+KxDrBVPwNjAtijxBDmGyfldMLuTBGm3IvnjwhGnB0Bu3shtjIQc
	HmUwpvjLdPWL0I2ugkn1vgrend6dZ8pR3bwQO
X-Gm-Gg: AZFdTZc5pSw6QHj+LZkRklgplnyaKRPeW5RvKiEUgRUwB/GZWscU34QldA1D8MZrys7
	5t22AD+I397ZwrxJco+gITQRUkdrlydQJvEZ+QETub0vsceAkHQf9tCvZeC4ENC/dUP7azTyFX3
	P7U58OCi3tirge2qcyY9N0Ab/bMD5TYd3kG0KpzTJGMBP0DRW1i6kRdoZxAVauTJjGzbyKjjs79
	lVYZgqugbEgRJcWOy+7aefZUdzdvlIgfTkCUufqhe8B/fp8OgxM9O5KtxeRUvwJ1LG2tT80UcGr
	Ecfom3K4sIHSrL7KFAWX9K6kb3vbXkOAGFaf8QGm7l++wIXfgcU8o5Qt+qgQWhESnRnV5iqzG/g
	Rlei9EuwGAEyOUk04MBbOAfOLm80QkdpI2au+Pw==
X-Received: by 2002:a17:902:ec8b:b0:2e8:6ae2:75db with SMTP id
 d9443c01a7336-2f03f18a9c9mr111167675ad.41.1795457966645; Mon, 23 Nov 2026
 10:19:26 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <sashiko-outbox-221816@kernel.org>
In-Reply-To: <sashiko-outbox-221816@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:19:00 +0100
X-Gm-Features: Aa3M54oPNh2HItK5OWAdt9J3mY6fBO_MvaXSMAuL_-aTSXsvBo00wfnHc9xmRpc
Message-ID: <CABdCQ=Pu=_M7wbP8SWA3ux4ztpnJoR3PzCn3bFg6ao7dxqXpUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

> [Severity: High]
> Does this break the DTB build when CONFIG_ARCH_SPACEMIT is enabled?
> Neither include/dt-bindings/power/spacemit,k1-power.h nor K1_PMDOMAIN_GPU
> is present in the tree yet, so preprocessing any SpacemiT K1 board DTS
> that includes k1.dtsi fails until the prerequisite power-domain series is
> applied.

This is expected when testing the patch in isolation: both
include/dt-bindings/power/spacemit,k1-power.h and K1_PMDOMAIN_GPU are
introduced by Yixun Lan's prerequisite K1 power-domain series [1] (noted
in the patch cover notes).

This DTS patch is meant to be applied after that series lands.

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
