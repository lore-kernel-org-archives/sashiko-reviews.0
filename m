Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426590;
	b=rPd2Hqn36Y8hZQnur7TKj2Ctu4Zd2ZpPX0U/BOeBX0FEVMwZYItsrUDks8TBw2qHD7PP
	 U3eFHzBk/5sDmIc6rkmCmWP85oWjNI6L7ab9euYYPgEsagdUPN+BPeB2vRD3zbSPIKa4r
	 5zSm0bPK6g8Cpc+FQzgOw6QRjjiraw/HTuxeNefpHlQ98cXMmQmoaBFn3Th1PRRbdi5jU
	 KcB6tbnuqt7GZe4sblaUsCRrMQ0aZi/SXTW44LpHLDLyOYEeTmST+UdhVl3FHwjV+Q9r6
	 F7e30DfG6vts+p4gYN15uiTszSBX+PzUO/G2uHaIGae/HRzqKGV5fb1BYyY5ofhkpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tWMbiH1ZllDhFsIxq3gitmWeOGpdMedMJ/cafKoVRxA=;
	b=s/HFLls2OugZ4IV4lAjmLj23Uzd6cJPoQa3JuKEMYR4VixF19ybzQKXsG2XexzLgpbKk
	 vkXqgfqULVMdxo7baOFPqGrmjK6o42hXVrZzUFTS7aDE2498PLTed4iJtKX5xihSG9yXy
	 nIjPHJRRfuCheKCOGaZTapwlNc6ixNq8H5gfFbdeP3KUrKiL1Q+YrB3ZtLXCUd+1M7EY7
	 YLkGaWCYqNWlbsTFAR3xOv/IGPHz7biANRCpJVorBjd64epHeImC4biOqYiCwAIJVcKOI
	 atM3WLJcRMyyVtq2kx9nVzmD0WJ+4UhB6JkOvyt8/pnRZHcTfiaBVE2+0D0jpPh61zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6F7AWpm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7D606A331
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C7D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6F7AWpm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37000e7234bso2405345eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426589; x=1795031389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWMbiH1ZllDhFsIxq3gitmWeOGpdMedMJ/cafKoVRxA=;
        b=E6F7AWpmINcH0ytKhjUFZx1xjx2kPY5VmKXzYHNOGS2LjR86XRueYCVUvKxwEcYM+K
         k08RBaj7oA6+6rprIAlLIqNgLxd5bdd58ejltiHZNZk3ROKbfOuxEXOsymV7ynMBRBmE
         kEn7DKCtE1fYOP1gwITZw3uyWqcZTRHOSkI3q/EdAoTGrG2i3z6r/GwCQsQOj8+sz9+M
         O1nXtOrT94jgqUjrzEhqFNgpAmn+qqcUENSZ/JZRRCPcDehyapA5G8/X+y4j9j7TGBbS
         CUog2SltWB6ZP1HeRi5ZtFwS3Cz7vC1fAiSa0rXa1PTjxEY+ezJB+vTuygOiWowRvBFZ
         yT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426589; x=1795031389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWMbiH1ZllDhFsIxq3gitmWeOGpdMedMJ/cafKoVRxA=;
        b=IvRMBdTI7Q4TmrkhcOLROA4HrH+zmBYboBcCZImvXy2M6s7bOTAFCG99RVsmVb6/0N
         S1COELqNM6+iIyBDCZG6+pcj/RZsYwlXzX8tFJz3HviKOIu+4KhCaqLpb26tvDphU3fe
         +aoVHeVPABZP7j3vb/Khv/vAHbEYQErki+gOdlG4ZDwzncl+sebwtzbodFwhxw9F0yg2
         atKyt9l4CzUWsRKfnbHJl1bnbLIxLIrYXMW8OuU98HlWd/4exGm0qcGLbBvGqF3+B+n6
         eMDHg0ixwsK1Uuq1kEegs8jrAM0vC5CqissYVgAW+fSFtNTyLavpl4gQFi6qKDyqRECH
         SBvw==
X-Forwarded-Encrypted: i=1; AL+hErFlvyOxnokSjd0UX3avb/l/YFRHg0YW0Pu0T5AehH+kdgSejc3F27bHS42D9Zh8ax2phY0PRbGdeOnoERgzm/g=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KckBZstTaP8vbCvorLyHM+/xUeiMtwVSeOfDEXH1IuYpGZJZZ
	XCf/7XO5FJX+ZdI6fH8th32QRH/zaIo8MFjeObiKfMOVET4Qov6VsanD
X-Gm-Gg: AYBFou27DAzoeBv4wzCCWfu5r3Ibv9ADtnIf5HkqG8QYpof8M04IxKvrd7sB0Em+5D+
	Q9P30VBiarr5hEp6RQUC4Z7B4s1tb/Rgf48SQNCxewoUnVq0wL4pq7XKTsq209MWrPCuEHVpSGz
	LLaP6zOQR+Z6ylk3JGEvH7quOFQsNwIVLZYlfn7dWKKpvtJR1maj+YvWI9e6jBXi4Y2TJpvgAog
	xBdcONRnWFQSYolr2Y3rmdBaLI9LGdhCvGSqXu6Op1zJDGAUjz4OD7oRRmkbg/6Lo/6lUSX9Jkm
	wRAVi95Y9A5OMMVEr+wgBEUdBsA5EOh3lFbacwCmL9xrDcdmQlcCpsGRsb/2P3L9rwgGWbPWqad
	wURlsztG7PRR4GLzf4LUS/6C3I30B4I8tB/sfbkM8+WUIuWzvSHRxtm265wcSrqwUOTGJXD6zwB
	2bVHm55T/DhAtGNiU/w0/CYsNWD6WrU6e1yRkq6XnXUSSVV7VQ9aIGI9Ctne4HW83TYuxBLdSNs
	lLw2LSQndiEwoIVWioEvLLx9UtNO1bCmcnJ/ZBdixE0tRcqnQrslDvDaj8qO7+K76ZagOjJDJRT
	yKNha9n5heh4Cr2La6XQ0Rh/BndFPG1MvDv4Vl4TzybIYOKJowpiBrYnp0ewfOdLfJ2Vvmw=
X-Received: by 2002:a05:693c:638e:10b0:375:dbeb:b363 with SMTP id 5a478bee46e88-37686d341eemr3916361eec.28.1794426588437;
        Wed, 11 Nov 2026 11:49:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm10505501eec.1.2026.11.11.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:49:47 -0800 (PST)
Date: Wed, 11 Nov 2026 11:49:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Juan Parrado <jparrado.1817@gmail.com>
Cc: sashiko-bot@kernel.org, linux-input@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, Juan Parrado <jparrado1817@gmail.com>
Subject: Re: [PATCH v3] [PATCH v3] xpad.c - Add support to Hori Real Arcade
 Pro 4
Message-ID: <avTG1Mkv0FLBGLPF@google.com>
References: <sashiko-outbox-204846@kernel.org>
 <20261109195830.22156-1-jparrado1817@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109195830.22156-1-jparrado1817@gmail.com>

On Mon, Nov 09, 2026 at 08:58:30PM +0100, Juan Parrado wrote:
> The HORI Real Arcade Pro 4 in PC mode is currently recognized by xpad.c as
> a 'Generic X-Box pad' and works out of the box. However, this generic name
> does not match the actual device name, making it difficult for users to
> distinguish this controller when multiple devices are connected.
> 
> Tested on physical hardware. The proposed change works perfectly as is.
> The MAP_TRIGGERS_TO_BUTTONS parameter does not work here. Other arcade
> sticks use an identical configuration, such as the 'Street Fighter IV
> FightPad' and the 'Hori Real Arcade Pro.EX Premium VLX'.
> 
> Signed-off-by: Juan Parrado <jparrado.1817@gmail.com>

Applied, thank you.

-- 
Dmitry
