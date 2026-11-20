Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195464;
	b=tnWx1G8/3iDmlUIOClubh64gafDlE160mzj9Tgvt+V8JGoUigIBRBhVuJOMsJep/H1Ky
	 RoR8wk5ldjgMMkL2vdSeMiKZFAVK9/ND9uWRPt9naFPkQUzq8fuSaJ4PRp0V2KzjUMwVW
	 NxsMYqDQfvVLBbGsLeC2MZWCi0x5uKdIohcTXOtGc397p2zlphiYEai8WCKI8ts4Hkl0J
	 qB73UxOil5Z3n6U99xwV69L1Dw9X+DBkmbw2re/aZFb85cUF7qQwMTGwE7gzgRGCPHS0R
	 nktHPAjwiYp8gCXtF4q0kabWu3uT9yHV8A5vGLhlYofstcuUmm1yaP8n1C+kP07iXMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=6NFMKm4Yb/EeljsK3MyT7gHKFnJ9GueDkr4QoDZuyMs=;
	b=bIuoRa7MyDZ0YL8QX38Aok3Icafo2O04TOapqWyVM6zfvTMOSQKfLy6hgH2AfwP/YvFX
	 2595s0sD6y8hdXZ/ufwAKLiY4S3zvEwjnCmgOGNbT3Ae1ujtI7GBH/qP9pC1k0zq9X2Na
	 2rsJ9qlYLUS3MMHFCtL1nqZmrAHIZnxWG1cfW5wK60ZvVfZsXj05g2wN3b7AP5yPCGe3C
	 MDaZbwT+jdMnW8iZZVV1g02ntP0gje0+ir/4In0F2zdCpx/x2K93hRQyUlKubRflwKFWk
	 4D5UvmQT8gwoo2x4XKhcgkipe4MdaOpHm5cZDMHwX9Sot/k6NDgIzVB7yDfRSzTeJpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=TGOhdYA6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63D606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F63D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=TGOhdYA6
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHI4kA2207682
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:24:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=6NFMKm4Yb/E
	eljsK3MyT7gHKFnJ9GueDkr4QoDZuyMs=; b=TGOhdYA62fn8n4BD/9TP8WBEWve
	Sx+7gr7K0vuT+XGt3vpcITfLWxgoo58oy8cN1z+8aR46XRmYfffQpZ2AYmqv3vjD
	C7SvuJq3M1zfcHJaNzAIFd2mHkqH6xyQ323zJqoyig76G8cGJ/i0Y0cVgH0WIQSv
	s4jvumLFpB0GpZssk/o9KEBlfPl69e9MwfrCIMZlJHJYXs/ic2VSNiUBFoA1HiqZ
	2zDPa+JTtOne0YMwq9R/9LPf/9Fjfq1YCWl5xAoy5teWK0rjcA9kjbQNJW0HdTWJ
	TqxnEPGOFIMwTH7MnMlN+k366/mTOhzRqaSGB+bhPHlg1EpyBGMRyNvUyEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tg2g2mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:24:23 -0800 (PST)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdacb64970bso760997a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195462; cv=none;
        d=google.com; s=arc-20260327;
        b=hNoN9H3h5khoYvEGqBdQhpIB6a6vF6k6qa2uyNRQNY3mykNS+FC0akdJMELyUCuv4/
         5pGUtuHwk9jET6nxEkMimVGCPZB6U1xe5zAN7CUTk0Nuy0usxmStJMiDaZNjRrKI9LXJ
         FSaN6ECKMXLcxtJWf9uOvaEb2er7hMn4NO+hOCpq07UwcVK6kY9tmek95hN+ZUyBypGk
         uoKx/vr2NjsdyMeBfmaAviyx3A0ADWPRfLe+1hQrXrtlxD8ZPWzR3dROpzXUCddMGvHS
         dwsaS9kS0RuAmj4OY0oQKdCKihpgcQkwse7CPYxEYftjn4ZuICZ1kTfOj05uiyETKR1t
         7dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=6NFMKm4Yb/EeljsK3MyT7gHKFnJ9GueDkr4QoDZuyMs=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=mLPSdcRsATG7DtzJOJTJNsoqT8duetv94CBL2ajbdtL+oCauQ+MTaBfKzPk/bWBFM3
         O5e89HMqO8aGDYPCzSQTUaEif9JaCSVi0F0rSy9tvaHlt4Av3RbvfxlDJjIKR+bAjj0Y
         nox/UrawcIGlBQfyETXQeAiiUfgJQTlYIWiJt+Vll/35V2deURD6Cg6axtnOwj+aWKB1
         h7f2l8dsIqWrLdLznhZfzEbdmJrUkIH/+m/trSVbQcZjwspTcQz9LrYJFsNhgl7idxp7
         17gehne7Bbb1cMTCNFlrAxIFwSL9vQabwMfPGgxCeoLgxPtkrlsuq6vNaPL5cevaP/NC
         2V7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195462; x=1795800262;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6NFMKm4Yb/EeljsK3MyT7gHKFnJ9GueDkr4QoDZuyMs=;
        b=EAGVL3/WoOglfpmXiipdQfppeXRwT0vZObRjNk+znmUVs1aa0k7Iuy9Va2o05JZ+Xz
         lIx54NIsU8OZ3o3owa37/9yfHVsLAB26kf5F1ovHPhMkzvJJvH8oazpoLq1vlJit832x
         xZtps2Jd19LFDXBUvpaWfXo696EA32cxcKpzkGEAI6o/o0LyvfYNFWz706s7QVGY5azW
         0RDtjuqsDUjZ131s2YnjSzBe5WqGCOVpc3UiR5kgodr2hKF4JeJfgDUpKI6Qr0rN5UwY
         Cn+8xIauNge+fwL1UP6eLgXBKTjHeDzCiXgu0zsZ8XDNtVhHidPO3Eg8taiPrkTVLQBN
         Rt1A==
X-Gm-Message-State: APuU4Z9z/MUnYX4L86bBtgdQMcVTUcaSBPNVnbmS+2FI0uLrgLPu1QX0
	+Pz4Y5ucM7h70npFLeHOoExzO2pIRboYXEDMiYPZCX6eqS0Jh8AOfxQkyp0QYV/loV+/YpeEV3V
	7XdLFFeWeEGFihqFKRIMLuMTLbKkkkozNqSBPHOf40pa98q3kr1bu45cVK2PRAMhujtN5J3blx2
	xJhdoGb7CCbV5DiQp6nM/Pkg/YKwEXkJIzjlY4kU2A9Sj74OtVRMVMfw==
X-Gm-Gg: AZFdTZcWsrtXJGdkqZzvfyu5QRgoGtHby+PATYLDXqcPvMXgYzel8RTMiL8T6CGYSW+
	Gb1yAxOStxFoc+kif/tzM+5Vv1FUi6M8E6eYPmH5Z2W/PC2hu+YUoT0PXp/awY11Ex7C/Dr7Kek
	Tuf99pPwxwZhr67MnA0jnTekD/IMckuM/A4Y7e2xRxbQE3stIJKaaSHgX2adawEI0Aeb1/CmNoj
	cMQoNofXHgLV43TD/6UuUYLtZ9HEU6E
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr3466647a91.5.1795195462145;
        Fri, 20 Nov 2026 09:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id
 98e67ed59e1d1-3b41c7d6061mr3466626a91.5.1795195461659; Fri, 20 Nov 2026
 09:24:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119013103.1092559-1-toddfreed@meta.com> <20261119013103.1092559-6-toddfreed@meta.com>
 <sashiko-outbox-224312@kernel.org>
In-Reply-To: <sashiko-outbox-224312@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 09:24:10 -0800
X-Gm-Features: AclHuK8M1lhzRbuuHmkqHDKPgh53wz_ndGWByADosNoypzx4IbYIadsZhadwjq8
Message-ID: <CADh2yMz9qKhfin-6R398WTGH6Xi5r-9r12TGf+HO2jsasVkqKQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 05/12] net: add METADATA_PSP dst to carry a
 psp association on an skb
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfXw+4k2G+Vbu4h
 R3rjp8+t+qSO2uuRcfnLTQBZ1mZWBAiLLkPWaIZ6HbYBLv6WympexgH8gzIG0H4Ui4V9YyfFR4D
 btP3KzJkLeVDuw3HnvrL4Rd7a0WG5vQ=
X-Proofpoint-ORIG-GUID: SNKFJjRJtQxUwaqEfjFWIir_SPE9Qqcb
X-Authority-Analysis: v=2.4 cv=NMJAaE6g c=1 sm=1 tr=0 ts=6b008247 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=7a1JM2k2UpYnRVFoQv4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfX7TleI40vx9nj
 8NU+GV34D3jVvjNK7jvsrkgCyubKiz26AiZBmhZdHvjfH+i4HkpBcySs/CxVr82nfC6pF7k9Hob
 5Fnv+ApqbUxvm+MOdmeqY4qn7Bdc32JCD/wZyY1tXPpFbIJFP0aQfpgnEktw/SKZm59XUXoGtIt
 8Hgzq2M7Opagbpwn7Zerru7RKfp5FAhGpZLRXwOQpa28zYnDRRxsZ2OHYMJPRwrh7E78uTASIrm
 F3pD/BYMf99R6HNaSqqlpGtfS86EhRVTa3uhdZbtJvbq12pPeJKt4BHB03vLTmU2S70sskXHgFa
 G/td1/V2C/NOhpeNzDPG4Jrh5YX3rfxeaCI9H3ezfFzpBbgaseOkE2jFzaOFSYDONRe88HGp9n3
 2lqOBV137IryQ2O3kcNLGykF8v4fQqPz3qsmA2sNtWdJvO4qmf6LBiKd/mxeDSMCFf1RrBsRnAc
 PEdYKrByZFTsiNbDccw==
X-Proofpoint-GUID: SNKFJjRJtQxUwaqEfjFWIir_SPE9Qqcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

> [Severity: High]
> Does sk_validate_xmit_skb() drop all METADATA_PSP packets sent by a
> TCP_TIME_WAIT socket when CONFIG_INET_PSP is enabled?
>
> When any TCP socket enters TCP_TIME_WAIT, inet_twsk_alloc() calls
> psp_twsk_init(), which unconditionally sets tw->tw_validate_xmit_skb even
> when the socket has no PSP association:

Since posting, this has been fixed upstream,

  82290fab668c (psp: only give time-wait sockets of PSP connections a validator)

-Todd
