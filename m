Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD748A8C1
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157435; cv=pass; b=CthPVr1o/9NHwvgbe+xA2D/GOOJT/Ki4hSTtUers8aOZzso54HBmWl01nqZDvNl3xEJ/8UrG7VehvieqNGlcf+ayKXP1Ivt5egVrhPljlgTzW2HUOkS/YSYy+jPplQt8YdL87W1PpaGedDL6hwwB/63LlaF/2oL6CZXK2OfSv3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157435; c=relaxed/simple;
	bh=9wzb+bkXQhH/592dFpKoXLTjmFDLvUUzyCaHRErkhcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYXbNRVIzcoO0Uui/nbeGm+W8WWUEqJTs5Iw5cViEmT1ThtiWJobtN7oRWKbMByhpcggbaSqe1S7yoeKZTKUMH3f6YcWf1a7tYp/0mMd9b+I/QkSWPbwUapiqSXe7OQfQhi5M7LqM2fZ2bDKwU5akHw9S0T3zvQDf5/vX9pqISs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC92+7JB; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC92+7JB"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so1366126e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 09:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787157432; cv=none;
        d=google.com; s=arc-20260327;
        b=FwyYyVJNb9i/W0EaEsIiWcXPX8UMJ6msi4KgPhRnJa9P9MTnLOdSw5I8RwiEcpqZt8
         Q6YLSe4HTu3bFQdM1xCsrxxFNCx62rcjobOZRIGTZXM+PEZT//LFa5A9p5ukXJHeYK4V
         734g+ygpRkudoLlt80n0rhekorX+zqAv2BcYgSHEH+EoF71zSGoTr0F5CkBu5YLEZQ/c
         3syw3rQAEe2sz3p5beXU9xPl03gW+h7iXe4R6eP20rEwkiI1r1SFiU0gJhWbohdzTOJv
         /zyhSuHLwUFGyckKbur2O0Xwe8Op+UKnXa2GiNnqLntHZVe6QD87yvK+HI8TfH3ChS4y
         KfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        fh=DKaxhmaQZl2Mr6QMtx93LDxRDsV+oE9CXq2Lg4UQyFk=;
        b=W9p19nTNv2rhimNw1ufzy4la9muPxhGlCOkeV5kJF/z+Je9JzoHocjoTWkkcf94wXl
         MGBGJYBMohUwhimp2xGvEuq2tkZR1gkUuaPXdKkkMItTrKx9v/ISifwJ4dQ4WglP9xs9
         LZvF9wIbprtVy90Rhc8pEDNpOZwj/FbfDbqBCezecksNCegzW5sQHKdvWHA0OV9XHI0t
         WUb2mf1CUCGRi7yFdVAolhaSKISWxqeGfxnsZwB53T8xpoXxZ35yEpp1hhdHK7Ti7pPR
         5Hz1HnaFKVPKaAarjFl3jB+hMFT4Phi3+dYL7itDIItypzhkLCpi2OpiGnuYbjD9t2kA
         TKBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787157432; x=1787762232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        b=cC92+7JBOamJDu2VeKUyEMHx1jk9Y/ubj1AUjQvTw7UWHAI5jaIuIuKqVWqmP9KHxC
         VxkEljt8PGacodh1/xxP/d9NFjTFnTQhzpTIjJJz52nMLBC81bsJiual7w1mxboZLDMd
         fb+gmlPa0Hd1PYZHg/ay4/cSgFjDwS/2L++FQCJ971G60v7w3x4Ma0meKy495vIKx25b
         V9aPPj+cI81rG/TlbFEegexkYy0xZzGQN3TfeE9vvseu0AOzIPqDJksA+lyVGj8UGxYw
         ZIa/ajNAIHNxt1fPQ77yT8arzdEdHP2m+J8FIw/AjMu5PYUC7U6WTpCndA7SlahhISQV
         PhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157432; x=1787762232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/2vYKJSDxn6CwCgQ44O6XRlCA3F0xRGLPQF24ansLE=;
        b=GqkBiGyICYJEJuNd7J9SMMv7n17Qhn9nvo3r4yZElrvIB5ruvfHoQ9e9pSTPt0G3d9
         NNubLoAQA1QZnsdgNc2mmGwWZk02kZ0BumcewpJ7Uzgp573XbA+MglXz4fM4vwVG+h0y
         iNWJz+SAravqOTiwjnEVYgxsxhvEIdYagWv8Z+B7wh4fTm8ImG2Nbr66ytuewvGayV8k
         XyD7VaZQSAQFBmYICw6OV8RFuBA0qRcRv9B7+VPvtVZtBFhLZrGMWJP31u9qwMGI98L3
         Bexz++TiGQy851q/43p2+Eou4gnkr5BbwF97DTMnUvA+iUNkFzVkGjqnbt9qh6UUfvh9
         LxIA==
X-Gm-Message-State: AOJu0YyW2JS3XJxZdD0U+Q49JZykxdT2TnK4xkWnuzdtPyJGY/DiQCYm
	CiebzqaXEndsYPpbWHxTySZKORWHY9zub+glSJO8fxK6HhMNMDltdyvL1hGz6YXYTPMc18JrgOD
	P4hPHaHeN37a6I/H8eDvdPE//BtfkVU4=
X-Gm-Gg: AR+sD10wdfE7mkUZlINlCx78QUVUxvUNAzXUiKDZOHkqF5L3nnhs17HJpFF+tygd9dH
	crUZlr7QvQHpb6hxoo0/S6cIgBBdSlZ8aq4Z30OL/7VYZzA/f4qETDg5qgNne3Mj2+tum9260mw
	g4e4acu+cnJT6JmY18e5hbaoiuwVCmDGbeJBmAYfCujDdSZNshEWpyTPzrrm2TCWuIkyapoZr6c
	343Jmogqe8HLgNUW9G9/vtt6cvvCYPVznYooqYC0taq+XcNEVWq/AcRRseaWrByfEwbuWFuj751
	P5KTvkPxSIlI/3WXhZC8evsdbvlLIB2dMHhGO0HmfVcAaWYgG9lZFUKBGoJNAl3QwTsWaxawXcB
	HCvTWXOSl8ALOjIlvItWNh3f9W2lmcOZMGg==
X-Received: by 2002:a05:6512:b9b:b0:5b4:58eb:cb6e with SMTP id
 2adb3069b0e04-5b478b927aemr1863019e87.5.1787157432057; Wed, 19 Aug 2026
 09:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com> <20260819092506.832631F000E9@smtp.kernel.org>
 <aoXAXFI3kRWh98R7@SMW015318> <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
 <aoXaIc5bX14esW4I@SMW015318>
In-Reply-To: <aoXaIc5bX14esW4I@SMW015318>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Aug 2026 13:37:00 -0300
X-Gm-Features: AcwNN1UdwmcaFSyr80JGaMi_4fZncJ2QrAHvbOJHJp6jkEGX3-W8WbTnt6JqwUo
Message-ID: <CAOMZO5BrzRYWbJZ5V7ca14znJ7NR4_MwxWMv7WSCeYsfMzLTNQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Zhipeng.wang_1@oss.nxp.com, 
	Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 1:30=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:

> Fabio:
>         Is it okay to let zhipeng to pick your patch to make a serial to
> avoid conflict at maintainer side?

Yes, sure.
