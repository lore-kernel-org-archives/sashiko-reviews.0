Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794622585;
	b=DZWnUcIQ0DPjGbBCQgbylzGJuNEIQHK5uL5uDrxh3pwaHdlSu3bLosF1Yt64Ffet8+8q
	 2U1BPk6ZOnuvqQm0gc8BTUQUAOL1S3kOV7/Be0DGXMgfR9uy3Yhq98JSG0OCwvOJlxK95
	 GBBmGt21kn4CKuOKVGkl5D757hFqT37x/Qz7uWAWTNG3/1bG5yNm45nGKN/8VDGH6/o6k
	 3X1jtvGv685pPY8hDjffpYIwG295emqLOkKNigR17cbA1BzsP0n1alkgQ9ZRBugRis6AH
	 Fr7Fj1Gi3csD3oeB7uhMWaIRAEFOHvxhXXBEB5j+9RC8u0fFLx5tCQ7qk+kY7mGpfkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
	b=jGk7ahdH80WRCFTIV6eNvo2S6cFhEmbdYojkU5JZGgyEm6F+C/2XbOLZQ31d9P26Mtju
	 JBezEAT4Bcf2Px3Y7OGva375wU75ZqBF46ilkyiLbW+fkKGMV45EFgnipPhyVWTEvQfGN
	 4srSJo6bbKoEZYvM2eNz/kBRtuecImEJdAqKiXWFLM8gm/M6pNQRDdTeBIS3d0K4ja+Dh
	 wS9OKmitY1BDYpNUerduz/dyv13hmUmrEuTgHoV/TSBtgWTRuGAtByxZ7DuxoY+QFtZqS
	 k2VK8a1g1I/PluyFpPQ6P4D8MH/h4shT5hEY9BKHTyRi8StQ/QvhuilAQpWHX3XP1Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qanx/bWG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24E606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 02:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F24E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qanx/bWG
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adf89523d8so2201611fa.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 18:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794622583; cv=none;
        d=google.com; s=arc-20260327;
        b=qKeY6DDzqY7QME8Q9rwsz5P/YZ33tAqyJgCOVw86+qwfET9HR8dWWS4GhVuapllPvt
         DbFzOceBsuwxwD0XuF9oM788TIOPozAT93FzkpZFs2CBYR6J8WxT1mL3EvOqtCkCUysg
         MLlyOoPPvpYSAMoEK79Yadji8cWajoynfWJMaPQC7+cumvkQL46nyFMIYN1WlK0XLnfH
         3lCTkP1313elXONamjwEpu4Sf5hKPhDh+9gH2PN0QS1Zqi6KGlhxpKMxDXx5NJQOFZdr
         xIkoKoWzHGbCPJLF/m7g/HnqnCfr8daQ7bGS3l/POlIIBThevG9kPSZplbpxM/gIq2vr
         evVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        fh=jlBv9+Xw61RO82aOy5OrcNUo9lcT5OBvSOXEAG3WHp4=;
        b=fg1svpGhidRAz/Ce2sIWBB6Qh8t1UlSDvQlSFAKsEhcOvZC8Veg6iFJ6jS98GI6oFT
         6uB6EG5+EFdx29JgPFdLOlDg4OvYCuOT3riRO/E7xPyLejl8UCCvilnWaEUTpwB8y/9d
         usnThM6SaZaAmVpsngPlVhzsW6+QbfuExe6wtWgJ3E+1FiWZnpg2GpbqKFi1bEgQrCYX
         r3dHYuvMbQANistWHMT/yu9c5Qvx2d4wt5cLs2wEIJGtI2ZIUucvSq1JDuFg3nRvMgjZ
         e4uHUZ4k8lVEXMiLgc/fjEN0QygumETKRkDYBGrLydbM6RXIbk/lz1/3SBbxPFITR781
         WSJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622583; x=1795227383; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        b=qanx/bWGvNPbadiwjZWZIXhCbNp4ZfVyzSnKulUy+ZyrXxvAEjk/6ycCIm695Fe0ja
         uWXskfu9SETvKdI56A/wX0XpGwm3GexkaPdrHGV1HySM9KQ4/5B2BgtcSZDNQ/mV89qw
         pO5yBxP26J0mYPSYHNiES41WFXto9UjFVPhzudEhh2L+XcQLba3jeEGAdOcFF01urWTZ
         +xNxoTHDQvHuzkir0HZV7SklBnxbAMQTXMSVI0xIkY2hABSTxijzwtKzWupbdBKMFBae
         7XCR9IbWrIqufrMUleUuauFM3/h2hfFZzWdzA8UYl/I4ioupyd+w8nLfvpm5Q1X8vw5o
         LMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622583; x=1795227383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        b=bGCVPrwPcoMTA+yX+9CUlmFx0+Sputwlfw4P3k5+AYHuwJ57ir3s8VakzYNrNwa6HW
         N8RPNIH9Ycw6Bol34WeiDEMZjyaAVxq/QvL2xeOJ3UG0r7mXnSqBz9S3TOdlknsuVOut
         WYUsUlxXZKh21cUFHjDEomYfpLJinDhGHBVXok7URAiMSug8Sw1LPs8xcbHhFVDuKB/A
         CjODiOa7cGow/9YxQh/sGF1PCOvp5Yg1M+zTexcWMS95Bs0SM43Bt7O8Urg93DK8tZlM
         4iGqSvBAzw3kBJWFcawSZqMD4al7wzG7Jd1Gu04KgzMP7mjaUxaAie9Oxu1VIA7xAch8
         a/dg==
X-Gm-Message-State: APuU4Z9GglTHWPqBT1sIKX0W4SQJe2W1eoTZ9xmO+YhT1AAwsI6/2IiU
	VSYOcuCmOzB3nUz22D8FomQEBcO2Nwhs2uAPP4sGP5nq38ZFuUhampXEyy83MSdXzqcEyvPL5/N
	C0Kdor6n0RIa95KEDXQEjttAT6irDoUbraQZFCK/PvA==
X-Gm-Gg: AYBFou3FtUmMG2LusLuscG5qF+3myWy0UAJ8/0Qac/5fMJv2hR/CZMrl0eAux+sr37E
	4GHO7BAA+2dHUQT2AwMqB03duymN7VJ7jiqgGIvgVRjHM//n29jnj5llv1zaa8LMFoaf2Eg4SmO
	pUea4s82dFtjJTG2Tn37Z+3nop2Yzc6EMvIF4Qd/EZAzpzbtsa1ySFGDpk/K+uOlvUeyowcgkWl
	yQRfB9tkFSECxJACiJcbZcp/Rz53jkV4/XzvNUcZnBLhDU+00WhyiCOiLg/6wYJ0mXx78O08CXA
	si4/n/5flnKcMcHwa9ghXXDPFwknLAJefNaOxkZXW3H7Lm+yA/75F/BDkVW/q73BH1wxetCJtcZ
	0PdpqZVpAhD/+VaqJrF7k5A/aarQqco3YipmGPj3tmwJskeRROORJvzdRQTbjzzUfbo4NUTg=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr1957787e87.0.1794622582532; Fri, 13 Nov 2026
 18:16:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com> <20261114-iep2-v1-2-a8edde5a21e1@gmail.com>
 <sashiko-outbox-213935@kernel.org>
In-Reply-To: <sashiko-outbox-213935@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 18:16:11 -0800
X-Gm-Features: AclHuK-eumJ5EkgAdvIOsdvyNYB05MQXF1E8x5skysCUrSKB4NwrQuQYc1Sc6RQ
Message-ID: <CAEy9hNXWr-v2r0rX7QO+Cu7NdTFk4AydEcn4qL-YwyrVTMRLGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rockchip: Add IEP2 deinterlacer driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

> When pm_runtime_resume_and_get() fails in iep_device_run(), does
> iep_fail_job() leave ctx->prev and the second field-rate CAPTURE buffer
> queued?

Yes. v2 returns both.

> Can writing 0xffffffff to IEP2_INT_CLR drop a frame-done interrupt when
> IEP2_INT_OSD_MAX fires first?

Yes. v2 clears only the bits it read.

> Can v4l2_m2m_suspend() race with iep_release() and read a freed m2m_ctx?

From remove(), yes. v2 unregisters the node first, then calls
v4l2_m2m_suspend() under the device mutex, which also waits for ioctls
in flight. In system suspend, tasks are frozen, so no release can run.

Arun
