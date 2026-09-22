Received: from mail-ua2-f27.google.com (mail-ua2-f27.google.com [74.125.226.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736B37B021
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066869; cv=none; b=PuN0haAF3/eO7fQLKhvwLXRe1dZhQ7EZEHeDEwoVBVKrlgGb08s4YwXAp5VSbDsP76mf1UjWLuynWV+g5KwTSCc2jFpgYjtqma2a4UbOlJI1YDUOYjUguuJGaTDzhsIDusStFLN8veygdU/xW8314gSVV8vndrjT4M6ICShd5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066869; c=relaxed/simple;
	bh=SKxdp95432XDvzCPjjgWzrtl8ftbBUukhI2StzJWGQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0CNCkJMvvZJpCsITLskLVzkF4E64szuYk0ZBHgaUKWASNhwlRG6mM21N95DpsQKcKpItiyXH4wuCa55VwbYaybBP5UP3vYrsJ5G2YaEO2fN8xURgE3B4dk4RGdcp5vla5Q2NbZdw9mSgqvtPgTwfLVSHPLFO8pIScwHv8dSwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f27.google.com with SMTP id a1e0cc1a2514c-97e7c7bac31so2115983241.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 01:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066866; x=1790671666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWIDjRua9lHrNbDmVCrugzijNwD0WxzTJmDg4pdKZIc=;
        b=SexBudiBFdB0djWTh64rA0YY02XEvclBmh76P0vBxFWUDazvdIAh6Lf51i/DQ9FZ1F
         gic7aKYMExcKa77P0jZ3IR/Sg7LaWu7u2YP+Ph73vUDrTkOEmI+wvBPU1WajRCFLzg4L
         itBNxGmlLSjGYJp/hXxByPn0OOrxEOGXPg7aK4vLzas15GszK9uTcTUB/sMKneEMlIOD
         Cn/70PNr92XvFk+umpOq2tenBv1LEIDAD6cQQ9n8sni+Q8LeoYPPyfwog8WAT+1CuweY
         fplV1fzSupHImYgXCbaPuzwRD0sMl8/lUO22jrvl46LgRhQPFh0FXnaeyu6REuJ9+JVz
         0c8Q==
X-Gm-Message-State: AFuF++ktUhG+oj5LygY8t2u8llrhpFBJnnqv5vUAqps77cFT0ejkqdOu
	vmNBgmxNApmr8D/OSDl2jEMjPp4qn8JbDbumg0sSpWtbV9Ho/yOzLeTRgzVhFgaFy7A=
X-Gm-Gg: AYBFou2cegbhZLUtUi2yXSOS80gjXsinfelY1h2ldCoPCoIeMUtdkSWPzeWo0z6EjyZ
	HnCoxaUwOhYLkZSHCbJswNL7Z59BmvDayeR/2jLm7ga5T81vBf5TQVNgBevicfmHfa50UACTi+/
	9e7l02kmaF+tmZAK+JtA81yMJmFCeRemUcblVzO6ix1D7qve7U0OUolguQ0J43FkFHSi7H4GuZJ
	gmkNllyW6AZyL6jDtIYXG0li6Z4jqRm2AcN6M50EtJ83iZFNbdafpwC1umQBXJukf0HBO5WncYr
	HFaDbC+1kC8R9cWpqI4o/fD3I8RVVEnZRU9oQgUIKXs/Q9/Y5W1zBMZF6rUISXvkLRK0NKXF5PH
	zQH1yR88YMvUd5tZIhm4QYjgv6OEDnlrgYcWTqsa//W32Qqvnqt+VxTaCxWqyZuEC2Nj0cQjvWD
	aHcN4VMUYsjMfMQjUuVWbhqyjKny1YxtBYQ8vIwAVAExSC2wUgj0FdrKNZawY2YkuNPNr59N+nh
	oJxZCychsOmktP0ayG07HivDyXvvlbjqe1k
X-Received: by 2002:a05:6102:3e8b:b0:7a7:198a:c2b7 with SMTP id ada2fe7eead31-7a7198ad3a4mr5373403137.31.1790066865787;
        Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab18445373sm1008159137.9.2026.09.22.01.47.45
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a5e045187so1620827137.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 01:47:45 -0700 (PDT)
X-Received: by 2002:a05:6102:6891:b0:7a5:391c:37ac with SMTP id
 ada2fe7eead31-7a55b439f6amr7821226137.10.1790066865188; Tue, 22 Sep 2026
 01:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790065451.git.geert+renesas@glider.be> <b8f4648eb1151b75d41e561c6b2adbd9bc4c0782.1790065451.git.geert+renesas@glider.be>
 <20260922083355.B7BAF1F0089A@smtp.kernel.org>
In-Reply-To: <20260922083355.B7BAF1F0089A@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 10:47:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR_-TG_FkP36yQEhcbSOObXCqsFa7iw7gYbQB-4Go=uA@mail.gmail.com>
X-Gm-Features: AclHuK8uO17HLkbg6-xa5vAIJjSfTAzcvmAvxN4S9JnEeQEAxUBJc4dK1JH3qYo
Message-ID: <CAMuHMdVR_-TG_FkP36yQEhcbSOObXCqsFa7iw7gYbQB-4Go=uA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas,sh-msiof: Add support for
 R-Car X5H
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Tue, 22 Sept 2026 at 10:33, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: weakened schema validation for older generations' dma counts
> --
>
> commit 339efeecd4721be8f1b5b945500191b6aa6436e7
> Author: Thanh Quan <thanh.quan.xn@renesas.com>
>
> dt-bindings: spi: renesas,sh-msiof: Add support for R-Car X5H
>
> Document support for Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) in the Renesas R-Car X5H (R8A78000) SoC, which is the first
> member of the R-Car Gen5 family.
>
> > diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> > index e0c7047ae8adb..41e423a42654d 100644
> > --- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> > +++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
>
> [ ... ]
>
> > @@ -100,11 +105,11 @@ properties:
> >
> >    dmas:
> >      minItems: 2
> > -    maxItems: 4
> > +    maxItems: 6
>
> [Severity: Medium]
> Does this unintentionally weaken schema validation for older generations?
>
> By relaxing the global maximum to 6, a device tree for older hardware (which
> only supports up to 4 DMAs) could now silently pass validation with an invalid
> number of DMA channels.
>
> Should this preserve maxItems: 4 globally and only override it to 6 inside an
> allOf: if-then conditional block for the new Gen5 compatible?

I wouldn't bother adding further restrictions, as these are not related
to the actual MSIOF block, but to on-SoC wiring.  DMARQ is just a single
signal going from the MSIOF block to one or more DMAC instances.
The number also differs among MSIOF instances on an SoC.

See also my similar replies for rcar-i2c and serial:
https://lore.kernel.org/all/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com/
https://lore.kernel.org/all/CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com/

Perhaps it would be a good idea to remember this?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
