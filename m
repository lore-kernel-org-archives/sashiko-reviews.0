Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8461C2AA
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063567; cv=pass; b=fDBU6NxZzjwUPP8YjBNyQLtGpU72Se6bEqt9CYM8P5iIFpfJD36l91dbfxYx7wsCtoTVCp6Y53SMXGiCNey2ubsn3fWTG0ecO9WwXAE//yNz6BcFkA3rMNVrKXIko5tQbB6iDhnDAge92/I87rLOZmN0vE0X6fDPt8mSF2447cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063567; c=relaxed/simple;
	bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFljKx7RfUgjGN3hOaq/1eOwl71jj+dGDP4nCc/8i/RFmddWZ9SAhJ058e4qZsC7kT1erfUDalGZrw2S5xaKla2tD5bdkQUUj7WJTeol7wEinS+AafPy9BUcKtiaqd/MgJYVyE/4RyFiuFv/nzDM+ggL6Dbu+vpwrcw89MmhKdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2UdptJa; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2UdptJa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49978908b35so35610395e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 07:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787063564; cv=none;
        d=google.com; s=arc-20260327;
        b=OvVqRhxQR6UwbsviPidLsO1AZ3k/oUj//eKli33BFkp/zOpakbiMOGqwuStIOWwJiF
         eMn0CUlmkW5dPGLhXCIk3WXm3JdJhbx7VLhpu2vqkwSgsNiLK/CHpdimAwW7K+dRXaPu
         3b+w3FY8nYLFkXfjxAoa8Nka9t+3Wfv2/q5z8Xw5mnfTDyERgOVniuoK+b3TblpYzSxb
         x+fF4AymT8fpPAjmTTWIIy9dx98HRT9phaMgN9Ec/Jt9J5iatB/mBBZyvC10iMGl2FQN
         d2SFUEL2gwCvE7zhDObfhol6c8dzdE5AVnW+AhMBSzoMnRjtebYXms4xRE+FKoMt4Xew
         CMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        fh=vk9AksSAWxHHCwKPyS6CzXUy0Ek9eDFG1guVFjdlSoI=;
        b=Gx/BzDoJ2NnhRG589yMuSu/e2A2HSWO2yAeGMMxQYtzY+nhWQpD8O7T5DsQorLe9DB
         U+7O4UTOi4aujMsGoEnlO/1MX6YtdvzfF0NUeJLf7rqEpOb3kaqgEf2hYdNWqxi1LxRs
         faK/Ryx6MQI4FxGPPTit75dKGCmi1l85Xp23Aq5h1V0Tm4as3sGOrAnXg+s1t+L/JOzS
         6eb1QvMl+zGbJW5/BJKK70ysBByrKZAH5sN9ZMyp8it+CpjAwL7/U8ZQ6EaMOEzvBQgR
         KzRfTItEcC1u82sinZj9eODF/surbvxwYaxFmOPB+Zq21BodXSyylidkpgLS8kzn74G3
         SDUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063564; x=1787668364; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        b=S2UdptJazEX6P/dk+hod/UW1un9AqELs6vWaGZLmCs225FF7A6T2IrV14eXlsR9fRr
         F7IAtcsxaE5j6QEA32C+8gKfZcSPzVf94VqHm1HImXVT47mdHdf1PXIz482inDxTXTaY
         38TdXpF+/VbUPegf3lH6Cn/iZ+rNeMjFr8fc8Ti9YWtsLr5tYuuqasiBwsNABf9qnfMs
         vigLfYqaAMPqLSbHOYBPXvsCDUIO2LefAOurmrFceSgowgwHLMD6JRBpPad3nbtUAC2K
         GGCbkaifHsKZlnYr7RXhVzZVlyKiN5mwk0iOvNnjAOO9M7BEmbvyjTZrk4D4UC8jsXEH
         K75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063564; x=1787668364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGssG08XGVBBqY+9J7nJH2PbzBb8vv1nnvneoVYMMxM=;
        b=B4VC0GOw+ePg1zmcN/sDAs07gPZ9Ltz/LZh7AFNr0KWRKcyV5NC+84gP8/oWoiLqaP
         9avaAD5OVlzPEj2r91Kny9+AiuQi09SO2x+B2lvqqON6l9NKu1JK4LmYyXo8juLfDGZ5
         6NSI04TueCYNGnFELZaVa2ON0kKDmJQwaoupof0tO+6APxKDLp8/u5BlVBx6cF7Dk+0y
         VeTyrgQfm9Q9zZhBC+GViQZD8jdjs0kiwbmd0B3qAAPivr8B1mVUMqBq0U/0c3m87AwD
         AFbysIfCijXPvvaPb0CNYeEmf9BShD6a03tAV1z0/khWf24ck1kKvHEfC4cXiVAwxne2
         MJ3w==
X-Gm-Message-State: AOJu0Ywn6ivKCAjU38Pr7YqT9IAAB9uC1kjknEBLdhBp94+jXBSEGSbC
	yv1R8ICSLDrbFP7qcg/rtdXiwYx86HFBjptY/mrF26Z1Uw4u0KeXl5FlGUA2iFQNnQWgvyfu39x
	ebQJAgy10LVf70Bpo9dWge9w3PazVa54=
X-Gm-Gg: AR+sD12AcJ9RB4LSeGpYB/1B2/lDyQor1NR+j50RdcdQ+/3sXzY9zqtE0ngU6LLyA1E
	k7zi2zqU6YCu78MrBlYXbz2UFmOwJkIXV/cLjwCq18EtIFe/qLAZLEuwSBo/yOigFL9nmy3Cq2I
	P8msyRLpc0EZ3R84kM95rcCYMZMG0kXVKWfOppnEUXeThk+pQ94ryq4yzEyCBYhob56hl1MCLaH
	eO3O59B9ovC+IVFyixiTr8j/CSadq0bLW72NNDnNc3XdROGoCSbNdGt99zWSHYoySOfRuq3AyOP
	7NLNEGTPck2kg69owN0+59mlAGIcRb3jxz1CX+ZPgZgZtOQYo5ZaO0QI2EBxXMSodrYmTXimkD8
	kmuRp/AjvyNAxiuRQneTTENuA6FUfV9Jd+uPl+MIxdrG4SL/9g0CJeOGY0mRAICc=
X-Received: by 2002:a05:600c:3495:b0:499:873b:471c with SMTP id
 5b1f17b1804b1-4998794fafdmr589623875e9.6.1787063564017; Tue, 18 Aug 2026
 07:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175846.7964C1F000E9@smtp.kernel.org> <aoQMyllxMOpY5sHx@ninjato>
In-Reply-To: <aoQMyllxMOpY5sHx@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:32:17 +0100
X-Gm-Features: AcwNN1VJxq7eVCEWfdNgZl_iK0BuChP1h-uLWAWz1h0QEtggQlEtSfG5vXSv_tI
Message-ID: <CA+V-a8vu6d2mo_zSDLi12gpQa12ag7kUnUWx6E6B1843wOy+Tg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H
 and RZ/N2H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Aug 18, 2026 at 8:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: Medium]
> > The commit message mentions that the RZ/T2H RTC variant supports a 1Hz =
clock
> > output signal on the RTCAT1HZ pin. Since this introduces a clock provid=
er
> > capability, shouldn't the #clock-cells property be documented and requi=
red
> > here with an appropriate const constraint?
>
> X5H has this as well but the feature has neither been implemented nor
> tested yet. So, I suggest to add related properties incrementally.
>
Agreed these properties can be added when support for this is being added.

Cheers,
Prabhakar
