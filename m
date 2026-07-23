Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F44766B0
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827749; cv=none; b=h0lol/hGqmzPFcRXarZivKDnAFxvzT2Cq1AOimDlhMMmrE8UCmV4TaXSzGw3ugoHLuz9zBfC7y0unjQ7CaDRw/eWohSBJbO08hz6fVoIpDYNrIww4/agDYkXqpWCU4vNvdm4x3fudOv9e12sAmhV1yWlG377Z2rbiQAXDDkBujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827749; c=relaxed/simple;
	bh=vykYW/pa+zA1M+X1pOWDQ3yvz9xPp8ytoB0pE8d6eH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtM+d5nCeWAn7QPprrxrF1IVPUeN8CbdZam0Irrc9/k5BJz7EOtcJjf8OGfdtJ+9hijf0EY/GFApK4aTiMoQeLPstM0AQ2uKxVcIcINuJrkaYnVG3OKKfgH/x7BrR7HWVPklEdR3fi+1UTlJ1J/QJjkVLADw0hfWT1iVukbgqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXPSZrz+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXPSZrz+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f75f7172so8020775e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784827746; x=1785432546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mESjB4FTq5J5yd8bHp4vOsYEbA8V78o1e2ORDrvPZPE=;
        b=eXPSZrz+YsiOjjak8TUBirktG4loflqSxSk0PwiwFmHFyfMZAeYJQoKEP9SHqkNkHg
         Nhz6rtviEBakK2e+aJmKpvC37pBwYfkYzy8lEu3Ftf8VagXCxtyfxczQhtxpaSzcBFS8
         yOAOBepVMjEj4XF69/eCGme0m6Fop9RYviX1hTsurOXobTk7PeMsNnoLj52THqdHGA8j
         FJ8jEPAKH6XaVviadX3D1cgBAjr+zukAWwGwda3dQCIh8rPud8lXRRzG+Fysr+woSHYz
         8wfAqZsXxCv1fyK4zl4rNd4TcIsVMIU+sJaBPmN9vD/LpVrpXG2zF8QPel3cp1HyjoYr
         ecTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827746; x=1785432546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mESjB4FTq5J5yd8bHp4vOsYEbA8V78o1e2ORDrvPZPE=;
        b=FeljgSMRzVh7YSK/17MpbvEEAx0L657TAZ6rwNHjg7HV3L3YPqjrT3+g0kS98QI7Z2
         /NRlOajlu5nFe7S131SEQpGiLQofViIqtZ0PS9fCXZzq5llK8rrvk4WvvX+I/Q25CnDo
         jaZol28vZHfb0ZJWf/LyTsOITnIJk7dKEm+wpid6HnkisU+ISH02hkd6mTAuG55EhFfc
         RRxbq6pdYcU8iNWAIR0TLnRexj6Qyji55cKs06SzDZu4DF/pr7voos5LvBSeCDofx4VW
         ss3YgTdMcy8LaT0WQZI5rtLxqthkR/eX4RCrrjEdJ2h9oofelhXqtGiBqnhH9h0L8cJV
         jW/w==
X-Gm-Message-State: AOJu0YwYsFqXqTxXMZr3mRCmqJpLPW8iTJSOJuOxirFNLTFmrsVOa66c
	/P0FoXWIDRIRzhYEgPJbqB4pBWMX7BUgbpdY5w7HFj1sRpDmdx1k//rbxESexKfvwRU=
X-Gm-Gg: AR+sD105WqXxGKSqvZCsFdQFzDdiGoevJW05j3MZ8YSK5TA9lX/8hHyka+EnaUipjVm
	3ac/LGISNvLLgQ30fQzo9yak6ziLTTJc/alJEUne5OooxBGi2DQJ0/QjHYoOgq1QRYHC41fTtaS
	c57dp2WDkhmEJmT0ddfwfqv3YHd41UzyhvaoD2e3T3Y7EZvV5Y+jpWjsf8SVQcv2Wtfm18uBaXH
	1zt/b7Z4xkq8SP1N0ZXlFV61tpDPx+q+pqgn7wmO/YfHubeNzOoJ4x0C3hrfysUk5ii+Yfta/JX
	IiaeuI2ne1+sSVCtDRy/HsW5Wfa4wkdWTHmYhQXaujh3azE0SfUFKhpSpJccA+XBCPXU0IQiHjX
	nc23oJssE/yJHvT+fkG+7OFvevxqnjCBorVYAmLAhotjQz9xLs/CDRZZ93RpeRCU6XZH9FWP3uA
	EF/9dQ
X-Received: by 2002:a05:600c:8289:b0:495:3af9:4cfe with SMTP id 5b1f17b1804b1-49573cf6d89mr48349715e9.20.1784827745515;
        Thu, 23 Jul 2026 10:29:05 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm17995418f8f.37.2026.07.23.10.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:29:05 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:27:33 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: rtc: abx80x: document ABX81X RTCs
Message-ID: <amJOp_1SFDdDfN-b@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-2-apokusinski01@gmail.com>
 <20260722200945.CA8891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722200945.CA8891F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 08:09:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The newly added SPI compatible strings `abracon,ab0815` and `abracon,ab1815` were omitted from the `if-then` conditional block that restricts trickle charger properties.
> - [Low] The schema explicitly introduces SPI support but fails to reference the standard SPI peripheral properties schema, causing common SPI properties to be rejected.
> --
> 
> --- Patch [1]: [PATCH 1/6] dt-bindings: rtc: abx80x: document ABX81X RTCs ---
> commit 74ad54b7ffcb981494fb52031a1edb5415b809ae
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> dt-bindings: rtc: abx80x: document ABX81X RTCs
> 
> Abracon AB0815 and AB1815 are RTC modules with SPI interface.
> 
> > diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> > index 355b0598411a6..234a103724b56 100644
> > --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> [ ... ]
> > @@ -21,10 +21,12 @@ properties:
> >        - abracon,ab0803
> >        - abracon,ab0804
> >        - abracon,ab0805
> > +      - abracon,ab0815
> >        - abracon,ab1801
> >        - abracon,ab1803
> >        - abracon,ab1804
> >        - abracon,ab1805
> > +      - abracon,ab1815
> >        - microcrystal,rv1805
> 
> [Severity: Low]
> Will the schema validator reject standard trickle charger properties for the
> newly added AB0815 and AB1815 compatible strings?
> 
> Looking at the conditional block later in the file:
> 
> allOf:
>   - $ref: rtc.yaml#
>   - if:
>       properties:
>         compatible:
>           not:
>             contains:
>               enum:
>                 - abracon,abx80x
>                 - abracon,ab0804
>                 - abracon,ab1804
>                 - abracon,ab0805
>                 - abracon,ab1805
> 
> Because abracon,ab0815 and abracon,ab1815 were omitted from this enum list,
> abracon,tc-diode and abracon,tc-resistor will evaluate to false for these
> variants. Should they be added to the list?
> 
> [ ... ]
Yes, the new compatible strings are missing here, will add them in v2.

