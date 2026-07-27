Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB05175A60
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131570; cv=none; b=fo+P5qAVsg0IYHOIsFIT6wPmxif7knHNMHz/XN9Bd+D5fUxEi/5QvT4djXoMIo80X+KwYRi8jtLm3KQ668FRwfrWySNVQqLeY1RCZxxnvokuJh7lVuYToYQZkHS9M0JwNIIqAZsAXAXFuA9BceoCMmFbv36Alf9SBUtVWxqYwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131570; c=relaxed/simple;
	bh=/qBjlPleAnxJ6DejuLJXEvSFMsQQfMBH7TLOv7r3uz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR90mMYPFXyWdWt2e1OOfBBq2H02BiUZRLAelL4Tbq15IoTiylxrpD5GhvCS9+/2B+T2a+yWjFVOHigN6cpC2bwO/6zVX2kuRZhgKxxbD37gswgfSbXJf4/lBmd8/5O2nY9aQMQGVJ5eV+eH9SgEo/JSpyIIGFIau8c1AZtdnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ytw72ttQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ytw72ttQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so24406675ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785131569; x=1785736369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hh+bRoGI9pU3WBcFYDGV8CJsvXt3xxUVeBerNliMbOY=;
        b=Ytw72ttQ2DwgsTgz3sTy6L9IPCDLnQwkF6udy7fsIBpibQrppbv31QdoYlstYhMehl
         5n6ClgkFBrYSy05dTZsIn1VOM2VqMP1Hl6LjP3wml1MDh/bhFoOtVNkV1wJhikELEHNv
         HUcaq+wSf5ZYaPAN5opirj+l8i2o86od5uxFeEKOKE7S3zseuXco+J5o88IU34/ZMMAg
         h8hiH3xOdS23zEqyCrTtpAtjFTGdh7O/tSx3xlhJ1br7GsyLlUMNF4P8rSdzkzhCVHCw
         q97eoRnDBvGSPi/I+okkp6Y2gKIc8vtsnVTX06ddPEPBdTE0IKSc1mDai45ZdkBTUmaU
         41kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131569; x=1785736369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh+bRoGI9pU3WBcFYDGV8CJsvXt3xxUVeBerNliMbOY=;
        b=snEhl13A9Q+OyYD9IfLUHJcM6yvkIBS7qujBDpagNwhXu64Qobc54NRCD1dTyM3uCr
         AZQdGIvgg5YiGsyakju3i9iNOSUT76HKARVhejdfAXcN0dLNfNUmhkCzVbonrzx7AH98
         4jEgU7mvYPtl9LqSxhdtOHnctZRy/MGPhB7hMZ8Qt/FVFnUqljaP1NBDqSdSeMhQDSkK
         prT1x1DczJv5EMLUyIc2/6yv4wlYzLrD26gOj5e1+QpKWH160Vv8vgTXKda+C/n1vhS2
         rfwFMzLdisT8HWPasAKbxLLx255O+YUzlGrCYrUrTaNQ0Co4b3TnGwJ26f4juoY1uTSK
         Un+Q==
X-Gm-Message-State: AOJu0YzfftPTdnyWmPR2gcUOojNYpzzMhA/Nj63RJXyDrjbMwNIAacLp
	/AOGZOKkCqJh29jG8OJdkjHVwJnUYq1VxJz2EGClfIRanay0Zaj9juQkUUupvA==
X-Gm-Gg: AR+sD12szDJb5DhGh73XcY5zwZ6Dikyj6L5QoL7iEaB9vFGLuSzL8NUffw4pt1VFxVp
	dLZMdncF784+U9TNPrOYZRymk5EXRUTPsWB6A5fAwMnKw2iYD+GFI5bF2CtcAut8on2DlkvYn9q
	1zL6lpo2ox107cV4yv41OyST9aTqbhgwJlkDUooDKlWyFTRA9BKRvIK3xDD8rEQhAQW6wCbluQ6
	Afyrr06PqNJ0qNVCf/YFoJ8TAdr0tPYNnmd9StkpO/TgoeRtJ62/xU+x4V9aDjJu6xv8pEkPTVV
	E4AH8Y2DLOPTN5Q8sK/oXt3rKphFP1lr9Dd9Qx6NW5fYO3A4//rpE/pqBJ3i1POlBdXAOivCWbp
	zefZUubZrvWi5i4NK09I71QumC/wgENis/+B1OXdRfDKfTf5YWSj6w45bDGqqRc15OYxAB418Sb
	tPlioZ5Uwf2uCXbWywBMBnQ/Pna/txdj8Yhg2KELew0PI=
X-Received: by 2002:a17:903:244c:b0:2cf:477f:57c5 with SMTP id d9443c01a7336-2cfde67c4d2mr67692215ad.1.1785131568658;
        Sun, 26 Jul 2026 22:52:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:fc2f:1878:e714:ef41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548efesm28720960eec.14.2026.07.26.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:52:47 -0700 (PDT)
Date: Sun, 26 Jul 2026 22:52:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: psmouse - clean up locking around
 disable_work_sync()
Message-ID: <ambxqW5K6ZfnYaBu@google.com>
References: <20260727050803.1269941-1-dmitry.torokhov@gmail.com>
 <20260727050803.1269941-2-dmitry.torokhov@gmail.com>
 <20260727053254.EE6B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727053254.EE6B71F000E9@smtp.kernel.org>

On Mon, Jul 27, 2026 at 05:32:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Moving disable_work_sync() to the top of psmouse_disconnect() breaks the early-abort synchronization in psmouse_resync(), causing delays and queuing stray reconnect events.
> --

This is incorrect analysis. Disconnect may happen a millisecond earlier
or millisecond later, and setting PSMOUSE_CMD_MODE first would not
change anything. We just have to deal with such scenario.

Thanks.

-- 
Dmitry
