Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFE51E432
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071935; cv=pass; b=o8uy/gm8wz2YTCVKJBKCqjMbSx1zA7QKmbaBVgZCkvPUlXV+Y3COvFCNqCYkRwKWKtDwYXH7kxT2eCvOgJaGe78OKMNxPd+ganuVz3CK2mLFi2560lmKd++81Hdic2lw9hvNeagfAKlapo3g+6bezCPRDlTAIOAnKAHQAp7Boyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071935; c=relaxed/simple;
	bh=d34ENdl7sUX1mC2XCxpsqQKP7Xbch1vuzKqxkOWiBNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rD4AVfsc1cZmS0exQLAik9gkp50fMfYqggReH6EAANK7kwH/A68fTcL3D7XLkYAgDZ1cxcMR2J4/1pZyAlxvecCYsZ7+aub/k+zaqsdwBz7VqrCmINiKfnTiUFuW1kRq+01KfG/gLTD3s7k09w9fuvfDHGRLfXKT6b+yhtHyWKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=hGp/XIST; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="hGp/XIST"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e87c66e556so22752855ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 06:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071932; cv=none;
        d=google.com; s=arc-20260327;
        b=fgGD22n+Kp1Vz5FvAxC8J0SolOx1kTQxVGE+eeK1gjmSIChk2HNJ0TvANFhg1ssBDG
         EVucuNnl57FYKNf/QeZsT4P/wilWy9QaWMeiAH5dk6ZUPrCOPJ7WxuodA7a4lT4DU/8M
         iHaJ6Rocib9yo6C808iSbG0ffWipNmcwiU9kMuzVPVAjo660Zp44xtEnW0WFPZ6frxpg
         O7DqsUFAceCqUfUD3RSM6ZjebhcsFetP4+gwhJpoAgfbNquBHKw8Xph4yoKRtHSTLdCT
         2QAgyhjSRHhbHVEx/SLonFytBPV2wPgCOCwB8xKYMl4IliRsL6UGJ+kUUiJEeXcoHHAu
         WRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d34ENdl7sUX1mC2XCxpsqQKP7Xbch1vuzKqxkOWiBNk=;
        fh=HpejU3OWQ2WGMLC30SR8o7u2r4zVlbVw3CLQsqSjj2g=;
        b=rNOMEMuuqnCcxwMQXwhrMWP2mADw0qETJAOoB3wiusicK8X3mj2hPgG4b49/hDg/Yd
         yDvqM1mP8aclnHGxsOmJCRGgY7E7kbrCTdpzXzliHoVSlfUOTwH0Gywg3dn/aEg5boqe
         a1umquEjTbL8h5daGbrRuh0PUZYdImmpgy6xziauUPchAygnMsn6rcwqLJM53wIY+rov
         4CAIcqMpjOBIhIBBn/eysVO5+gYtN7oyoo/qdyme0KdtDyrRS5N/4baHUu42X+eDu2n6
         GEOkT7UtSCCHuMjBWuv/eSEbevd6IqAwMJB2shABnlwbB1UCouK6yfbXwOAd2ym84n6C
         vYJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1792071932; x=1792676732; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d34ENdl7sUX1mC2XCxpsqQKP7Xbch1vuzKqxkOWiBNk=;
        b=hGp/XISTRKChZ8cweLrPbiB9DTfy6nq9Ra/lYvYAdbiqyG9K9Z/fndEPMAg+3dDTQe
         waa5xjNyVkVqfV7fHEXYvDQpRSkuf3U2pvx6Ru/wbpbFZjFUpqws1odY1cOL5hQEMUe2
         9c4MPev3RH+f/ZL7CG+IYKcp3bAXR7XHC62pFTU+3S8s378TnkJATguzJjOUMcsaZOEP
         kEqFburGhTVzdX/6mvIyCadSxy4KZOrLMTuphzbqxvBCtBGywWBjklfI8Tx1IA1Zsbvw
         q+GDDHjXJSNxVYMNg9hpZBlTB8VfsojZufbAlyUXzMcKKHMibrDZnJMWFRTYuZwBREaR
         4YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071932; x=1792676732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d34ENdl7sUX1mC2XCxpsqQKP7Xbch1vuzKqxkOWiBNk=;
        b=SpZgs6TM8O1aGY9FgmjtzSGMsA2QOL1COlbCKF9nzLARH1rk69/skGjRuCYFKOOHqW
         kyJn/ZVI1vh5xyvBXFDOlAnv0MXdshlWbiBZftIr4RQiEtp1tByXfVsNQ9xcoGQd1RX5
         D5J+n/cvj2x77uUYrWiSrMqzqI26NFK+8vck4M4i3caYu/gTO/22u+B7emtbJGpqu7L3
         27dQjVRYpNOBofResCE7UUs+r/rvAU90OG9+qJ1kDWKx67BgD/+NZ3hBpcWtnMopcswY
         lK3mpvOUobi3hqXA2TMIGYfap3jqCZ3EpQncgt5yopXyMKPsbMWUlZYg6UgkZ0ruJ+Ko
         JrUg==
X-Gm-Message-State: AFq9FYLXZVpGM1WkxaVNg1zFfuAg8L4uoc9XbKVoGUITsTBr9cYj3Skn
	pzNYA1Fs/dhZQDwsv5SU4XdvyPOyqv/+ePGkQxFSnDkdZB0+pK/FO3maruPmrZZY/7AAxNYJt2j
	Xh5CnrzrDPjgG5K7b4yUGz9yyI8hbQV2iVgVbjLt7FKnvL42S5YKyJ+4=
X-Gm-Gg: AYBFou1w2epTXRnknCi4P2m/qhAnFW8rgGYA1ficQK4DdJPlLymW/oxyMMjMKVyqrEI
	mFW1CWwyox/SYjy2dR12z9IDTKELrXiIa/puCh9isaWmGWU7MkzUmhIkp6B2Lh3D/V40RfWybtE
	D2WyQutuyCh/WlKpFBWjW5I/0nyXmiTgmOQvQ1T6kClOfVRoxZD7ftV6lwuyE7w7vdEhf0+dUCc
	W77pd9tJ/zXxc+cUb4e7dAwAXE7crX6r7+wJiyI/Ggb9Hs8AABnYqxD3KqUYA6gRpq6zgDUePa4
	yjvUqc3r15/BGzTSmQO08S+3Vv3EhtjNszAO2AbDOwRgxteueVqRn3s=
X-Received: by 2002:a17:903:15c8:b0:2e9:29ec:f894 with SMTP id
 d9443c01a7336-2e97756f34dmr280475ad.31.1792071932367; Thu, 15 Oct 2026
 06:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015131301.711153-1-daniels@collabora.com>
 <20261015131301.711153-3-daniels@collabora.com> <sashiko-outbox-172908@kernel.org>
In-Reply-To: <sashiko-outbox-172908@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 15 Oct 2026 14:45:20 +0100
X-Gm-Features: AclHuK8waALSrdB4EhLPtv8GlX23W-lExWqq8q2cI2vUC4GU2EE7toXsccGM2Ac
Message-ID: <CAPj87rN_iucmsrZhNK=xNgZrOSxBcmHEm9hEkwQn10LQQsj24A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panthor: Delegate neural power domain to CSF when present
To: sashiko-reviews@lists.linux.dev
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 14:18, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] panthor: resource leak due to incorrect LIFO label ordering in error path
> - [Medium] panthor: incorrect hardware teardown order and duplicate TILER power-off
> - [Low] panthor: build failure due to returning a label identifier

Well, that's tremendously embarrassing. Will follow up with v2 sent
from the branch that both builds and works, not the one full of rebase
detritus.
