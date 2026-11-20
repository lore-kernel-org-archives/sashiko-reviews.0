Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174875;
	b=Mw7ingN4QuZ9VEcG1mTH4TkwY86x8ttzr33b2SlaArCbwEwiY63+4XtlXAceV72F137K
	 PZoKtts6MrXXAyJHeaDCeSQbhxuIbciYecK3fU0l6ZAspCHRe3tvHjXDu817Q/LCZxbw8
	 eVoUsBE//bRp2kA9a2EHcJwIoV7vOo6tJprK3ZazunI7HCMpkTzr4zqHwQwutnK+nrT/F
	 X/9l1ciBbbIS5e2qx91a6lBjrAehPWhrwBVz6LRaLBhNkEzYGegfrkDTvMAXV1bUHPR/U
	 FWgDlRntiaqD2RoaTzgGvM3D1nkb0tqTzhstSS6PZCH2JktUQ/zgjRUlfzdHcbQ7ZIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
	b=LTg6jqnvZN54iYs6tEXUYxux1jZY3wXgLwoMN6W964CYIGcbBW94suIGtLpG86ZjmXr0
	 XcpShLRsAo2GjijTxAvW8OQW4C8udakT1iHJcgM/R54TtBc9oUxJRtSlFIGZ0U9QjA9XL
	 IaiGnZFECdwLMCPpWwRxUt1w81G+X2e4evN7recoTA/yWRx1jRB9yubiLPOf4dvHgpQGD
	 MDN+1WGGuLB88gN/8LE+Qi+sIbl6Jb8Sy6MIJRCVy5JxJDLd6Klanxjv9ZV+Pxjgo2Hbb
	 bZ/mboluYuoVs7rgjyRNU0/KcF8aYtiYwUOCQEMgHRRI4HVkAsYLPwuQtZf6cr7e8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="f/0FQlHC";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5F606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=f/0FQlHC
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1737156a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174875; x=1795779675; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=f/0FQlHCd0s0hWR/JEQWQYstV04c3N6d5CVU+kPj4g8Cgu/a4Prm56oVdYpPKrPSas
         7Vk6Af4eaR7G+0oNNYWVxLevnG8YKfCVNHVCgFNDmxp4rFhBjTWn2wRSEWDsGQtTu7Ub
         EqwDtSHZuoxzSyFrZ8liufyWwenMDjygn7GQs7q1xNt4xNYxsRKy1oUySGoX4N+Og9IW
         KOBMsRSryQjwuI8ojQf5jd2sogefA8J8j7qmMwsty8Qq3K0hcfEaYE08vUsk89Wjzjsp
         eq15rTS4QrXv8uYDHAK5UrvCQh0YY5VDy15nC0/pXwIXuWSiY0Khw8phbQ9UGpYxBmMc
         3axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174875; x=1795779675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=u+M5UBxSw6J9yAFjR9b3okK6Fl4a2Txm3apIYcBoELNS++N33ClatgTCn/iMddb1sA
         0CSm0NK5A19yk+H0UUngB6j7G9gEWjeW29r6ZgVxWJSFT0bSDEqtyX1orgnTHrZBkiB4
         nDmkT6uyS7BqhwEdS5uhLyv5JfStOdH9/wUJA0lbjj2xqubDP+1McSEMWRg1Ga9SKaIx
         XqjGzBKKZDYEHJa7aHUn8QF36dVIV+3D9/H5K1kmr27KEvG41MLlT4pqMKSgU7EFsg8x
         OD2sucA+JhN0XM1lZoLyMz9Owfqd1tFwivpPy2k56V1ADOTzQVXWh8X0+2lccO6s9kFI
         Vrrw==
X-Forwarded-Encrypted: i=1; AL+hErFConb1SgDNlVczt6QWTBwX7WZj/2cp8JbOToOVLcPIy6jkK7zckQ9TIvx1yMvVdzOqvhupPTHm2zf3nTnDbuM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9NOAp92vqQ+lj63ZtJfveLVJiog1G4RFabE8D1O7JqECgR2vxS
	oZjkk0nJ6VDhjQxMWuyrVMdMEst678dv9mbXXrcmN6lKngxyNk6DWCHKL3ozCaJqVAY=
X-Gm-Gg: AZFdTZfb4PUK9/QqpMwvl7uKX+TKbdjUUeN72VM6XJu2Y6+dL1TgUZyZfyKGvt1lxiP
	YuaraLRsF/wSyCo/3HVll3hlY3rOON0uhn70pl177b4TlolAUi46UBze+EqHbYc2SxqcslxdhFB
	0SwG/cIQixj0Wlr9DyArqqq2z0OxD93m2qRKM7Cv+uBP4CmGkWqUvn53qgJ1mTDmFBbtJmigaHa
	BdmAgOHeKs3TtDEeL+9nwQry167b5h1YOhDl5Kf0Zb1rV/tIWBTvgmb+DJgyADtcflZjloYdMqz
	JwJGs7/5fYKwtQ0Ai5P9Rw3eQSKeEf1P4HnuUDGSgD6skzkgANwoPZyFh86e7jFFZJVU5N4WIx1
	MZHfLG7PBixeraNRH834LkTrmONo4HPNgCqZxHU+EwgzgzQLRMrfKcjr27RdzVRtZy4sGaao51C
	AbBxRSMjqBrTyZMyplemrTAlKk+xE8GSoXuoJCpCMcqEPBECR3+7BPj+VAkz3C265wmlctf4L27
	NDgiOQD00/kNpWXjzwHapTLIY26Lvf6SunvjfiAfzIyTnzu/R93cBvCLSrSQZ1n7v/kNob4+iPf
	mlkE1pbPROjYSNtpWZAhWSGHfSp1so57ulq7d0jYcgXhI/Zau/wbzwtwUMhN71eOl4RYSAs2k0t
	DSiTzor4KXUF+wmSv0OBamvNWpTDNnbyJJizM
X-Received: by 2002:a17:90b:3e48:b0:3ab:55de:e089 with SMTP id 98e67ed59e1d1-3b40a611fbfmr3110569a91.40.1795174874780;
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm4125523a91.2.2026.11.20.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Fri, 20 Nov 2026 20:41:08 +0900
Message-ID: <20261120114108.3071955-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
