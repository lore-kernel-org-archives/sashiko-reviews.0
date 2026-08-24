Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB344CF29
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586074; cv=none; b=fBOPcNsnK89m3k0X8N3k7FZ0TN1mp5A/kzegRwNgDZuEmVVdYNWjTUGvQ7LcyJ4VufaDnngb2Q6i+ZDJvbmwE9FjuCs5tDCk8lBDEaO+OlsZ2PaHOeioCQ7R69He+4w6oFt+i/NinQjXKqKeAc+wEexbKvQ9SWWeln/yrKzCbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586074; c=relaxed/simple;
	bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F84hxgQERFa8lxaK0pkxxj5do2sQqa5e7JefKTEYnSKpEFjNYFxNi+3iMzExhNg6N+rMlDAZheLNp1kiQPJhO9y1AvwBkMzUjGgMPWer9lhao/Un7BSaQZ0PucMlo7zDZc+9391vPW8EhcvGAnaEbV0yIrgouBRZf08QWtuetyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjQY9n9o; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjQY9n9o"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso50263a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787586066; x=1788190866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=RjQY9n9o4OM9GQYgbETDYPtpGfu54wM2i9qOOyMlth+U/+qZ/0iZjeXmxzfVSBUlXj
         gsa/6UaEUyqld7KUZoIvOg9VX2AWWdfr343hYFeBuEkhQ+SGXYPv87XlQKTpMdTai7xS
         /zVUNvO7m/9AqMjsLe8iSJi0uDUpW3iP9UCPo+puBjdZ/7wj74Vlp2LEhA/6dUoPtZRr
         /22g0za7CYF/qPO3H7ruRtCMnpNomR/15kfUBzT7j8iE4FAcQqeu7qT8KgMoGngAlfzr
         umet351clsSKax95DMv8NhMo27MKLpzzTKQXKYCBLSG3l1D6sQciGZ+89hW/BcGo/wer
         WdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586066; x=1788190866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=SeOr41TKjP/5KIhTtD53kRNwV+Di+29O3rH4BVD9JsSOSg87pK9vP25QekTJfDoZeP
         wcpz3o+ArGpBmdsvkN83LJHyvU81icuIH4GSlr9G4S05h49R0chfjEUTbXKoMcaifNFw
         LOBHQfXp4gmHK1QkOl+4rdsTHcg/kOqcLeO5gVJXA33JaAI3VMFehHYv3P2bDkjqXazi
         SDnChhNjA5U7VvobKoSa9gCZAeED62/+SolRU9zfiKJ/BAJPZbk01Y4bsIcLguK7m2H6
         jZzLiLxQMSbtie6E0F6UrdEDwYEdmL5A865Hv8IWW6iKa4SRl/KVA35DU8xExGOCmZlB
         0WzA==
X-Gm-Message-State: AFuF++lF53aNmH3WufLprao3CdUq1ax5/NMSXtGZbdTi4kbye1cSl89G
	4rGK8azxtmoHnOixpcR+kYhMhBdf4xTvV8WkABWJM2o96EXx1WwiTMQD7/zZFQ==
X-Gm-Gg: AR+sD13wPkZSlON+t0Z+XzjvLJbn/F2QwwQ4yNegX+ogDF0+dPqVgZGl92/tzuBhFxP
	RFIIEq5BQaw04geDdcme6aXfR4VrvmyrbmD0TvjbRDL4+Uokh2x94zCG0djssnvHUGykd69pDAv
	L/UIaegViVvRcz9fHgr4/j0WChtt8S9+UJcTDiCKdnZeOeRbO7DWIRJb8/bc6WZOMKDq5bwD1yf
	y4bRQ0Bm0o78gDRXSI21Q1c/1FNTnRVjOkbDM2gTEIEDsU4Eoj8Vgcd2tRSPgl148qNRircn+s3
	+2U656IArE3wGmbPtdxKf1Ml45zvwShxEJts/DS7b6pPmHy846xja2JqILcyI1QCMXswE5Z4Ty7
	QSi4Sdnf4DLK5vddjo0eG35eC/aguJ1go0f4EOknBMPC15ZqX3N+MYdmJs/foJXoarf8WMbT9Ai
	v0phxrvIwEVXG7OZhp1Nk54HQ1xSM6zkwqYmVaRwwiDAmfNv9BZJEWuxMNL6l/z9xwNAwijecDH
	MY09a5GD1OSSB6QgAe5t2suHRKRyJYbbz8rr3hh6dCV1mlTWcQChE/u572cZUY0cQo=
X-Received: by 2002:a17:907:60cd:b0:c12:8a:7d7b with SMTP id a640c23a62f3a-c24e2aa65c6mr12519166b.1.1787586065638;
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-208-169.net.vodafone.it. [5.90.208.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1230685366b.9.2026.08.24.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:41:02 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <aoxmDpCMITmyuHHO@GLaDOS.station>
References: <cover.1787583584.git.stefano.r@variscite.com>
 <aa8af884a709961f155f855b8a480488ef4c47d1.1787583584.git.stefano.r@variscite.com>
 <20260824153400.119F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824153400.119F61F000E9@smtp.kernel.org>

On Mon, Aug 24, 2026 at 03:33:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The ads7846 touchscreen specifies an active-high GPIO for pendown, which conflicts with its active-low interrupt and breaks touch detection.
> - [High] The V1 hardware WiFi regulator (`reg_vmmc_wl`) lacks a `gpio` property and relies on a userspace script to enable WiFi power, breaking automatic device probing.
> - [Medium] The `wm8904` codec's `IN1L` pin is configured as a digital microphone input but is simultaneously routed to an analog 'Microphone Jack' in the DAPM topology.
> - [Low] Non-generic node names and invalid characters are used for the touchscreen, audio codec devices, and regulators.


I'm going to fix these errors.

Stefano
