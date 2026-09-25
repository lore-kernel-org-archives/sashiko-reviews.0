Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B83C98BF
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 04:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311857; cv=none; b=BCulYydusdWkybVCRzGBIArz44KFLE9fGbU6clDLkr8r+cbLXNw89ZuFe7OuSjVciZr84Rg6aOahO7mP7Sg8Gv+gBVzUMyFTdg6r/cCGNQDiRXrSFe4HqfZ5o1GTid83yM/45gO4nyaqlJh/FHWBKjNywIeaPwKr3R7bvuO+sXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311857; c=relaxed/simple;
	bh=Jda9Cr+a/gQLEGQJCn78dqhXEbQP7tafcvv2YamXTSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAMPdIOW3M5T0Hp2QfF4ABKudGxoZcmtQ96UzbM/u9g/7sT8QsttVt+stmA+o2i8awRNqkcKPvWfemUX9pLY/Bk/Dz3ypfFlK1GBoRSS1/s1dhppapKBlBHV8TIoNNtZSDnOJyYUeck/kvOVeXVLpaNA73ciU06/89UNVuIVcIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkDOIJqK; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkDOIJqK"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so447972b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 21:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311853; x=1790916653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/rCNzKY8hj1VkaRGisgTod/0wIazqSGTBqvD8A0lflc=;
        b=lkDOIJqKihgcQ34F/EeMF0GQQVjKForjy7WZIBNVfwzpLojmIFluJVL+r2hjkXL8Lq
         rsPuKS6Z1Kd8wvP+jvIRtSETFhdchNuNO+q+k0GbHckAgLdeW3KW8jpNH8A/rluiws/m
         2kvyyo4qgWTino8yx4K0b6xUYixroPbaeRBNcK4A8MrfyhjyeqKas7Jm5rwKtAe+jhnR
         XH630tIWgFTjp2luscjeG6RGUAsnLNaXeR1+uUxKzlpn/VaisxU/VMg3IOl0cBERoOpo
         tCLebh1AdIkE+DwKL/9d3jym0EdzOEMrnLZCWBPH54zaerwE6q7b9izEpcWEZAcmRogl
         1Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311853; x=1790916653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rCNzKY8hj1VkaRGisgTod/0wIazqSGTBqvD8A0lflc=;
        b=kSb0p2Kl+lr9Uiid3Oq/J754WHpypMdF2iFI25jHH+rwuJxEgcJerz2l5LIKbBJzQD
         yQ4Qn9Ld+cKGPE4ZV4ML9xuyBWufT6DEaUPvgID8sJPH4gZdVOPxklXHC4TO8DtZATDF
         BuVDs1envlIM39PYcFX/nmdb17PCOz0bRVjxff3SXaye356pZQ3xSdbuq6kSlOlBwpaU
         8W1X1A/18TcrTPjIOf1hbKx2PVr5Zg9N6LLn6pAzIC5y3F8zWELorPQV7KLlgitC0dyu
         VHgLy9W456vn0eHB0zObuWqAns7QgvP0YIL4MxxBb8nyJ+skYKtnYoyOg4L4QzUOr8hl
         vpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJt7Oa2e4376qfyO3E5k8OJOp0Jxc1RSvQcty1e5LYUiA0oJKqO2nNW4GSjBRVhNuMd6nKACBhRweoa0zFG5k=@lists.linux.dev
X-Gm-Message-State: AFuF++kJhlUPVE485uHOwb3biaPDsjVzdFGsikq21kC8ml280KTV9L48
	2x9Od8Vnz7nl+/rdqKeUgTJCwbXz9OOng2ghPSWNVuzGcTdlsrUZieB3
X-Gm-Gg: AYBFou0mMCtjzL9bUL6V0fIbgcwtFUzNzxtkO4sWCFTteIGHg4epJOYQHZ5zpZ8z7dB
	fVxO8w+MoDqQI5c6Sqe3qjp1GYpR4s6cKMah/afTneOToh/9W1KwT+XiIorcEY4f1mLg4iTnC3m
	xDwwqOXTtrVetZb3/+FXd31M9KtyKT6b5x1kmAZYEP48aL+WTx4kvgHDQSFXRr4Vp/iSnC+jBGe
	gcoyEiy+wUd5YGwHZWy5828W6O+AQ1QkPHdLi6u35YjY5umBSZFkvMCxFKKTF1h9yuibCDmfIPM
	6fwiuOTacZgRZ9BzJ1+G9M5QDrSwVLOZVxXOAqBoC5qMA0y4fVDFMaiE9cG2K/amDJl7LhM2XEX
	CMM77EZItcLsCVDjvgHyXV3ElHHYRUaNPABV+uHxJowz9qdx70CBCb/znaRZc7S74QbavTrK914
	xhZ5Zeh+AtWwPptkYV5Rkx/O13bz7OtVKwQN3IQv0Y4sziL4c9JuGTP7Rhevc5yEs5vqRh8jajs
	n9eyryjLLUd
X-Received: by 2002:a05:6a00:2d06:b0:87c:d962:72cb with SMTP id d2e1a72fcca58-87e9ef53f21mr3522647b3a.40.1790311852836;
        Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf89651sm463483b3a.41.2026.09.24.21.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 21:50:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Message-ID: <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org>
 <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net>
 <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> Hi Geunter/Prabhakar,
> 
...
> Just a question,
> For automatic software upgrade, if the reboot using PSCI fails, what is the fallback
> for reboot, reset the board?

That seems to be a bit theoretic. The reason for having the ability to
register multiple restart handlers is not to have failure fallbacks,
but to have fallbacks if preferred restart handlers are not available.
If the PSCI restart handler is present, it is expected to work.
That is why it has higher priority. The idea is to use the highest
priority restart handler, not to try one after another.

Sure, the failure fallback works as well, but that doesn't mean
that fallbacks should be provided just to provide fallbacks.

If you claim that the PSCI restart handler does not work on this
system, provide evicence, and we can discuss this further.

Thanks,
Guenter
