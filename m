Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17F39CCF5
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345004; cv=pass; b=RB6Fhh7YS+C/6xEOU8/qIhgxrj/wKnSZX9AI4AcwoB8Us+ijLW8QFc9f2uOFEOvE1q6Mj3/vQiFbKS17yVfvk0qK5lrI5CFVY6sAoySvPPF9mSybvArWqGHos1MdOmm7aBNlGL24QmxEnG+qJUgvLMSbYBmi2KcB/OCY8vv5GNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345004; c=relaxed/simple;
	bh=wPfN7PhPagaHp95lUT4nN6VYB+U3rCdvZ9ElbHnKR9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIgzPSSm/5ko/1LllD5nVR55ZLEQztkqFPTXyypsYCxtWvNbOZZ7d4FoCSQes43be5NIVvxSmvkBqSU8MTCmabeNIwewMvHWmYmODXyMZ9Nz4wi+6adu7naeEljTtbnkqWmtVyu+Hp1auZeogy1xBIIJRAM6/St6p9LoBlssE/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLFeuiBY; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLFeuiBY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4798bea72f9so731658f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 13:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787345001; cv=none;
        d=google.com; s=arc-20260327;
        b=n5CI49GAgUJ7NnTGpzLgTTcKtpucMFEJAOqyWh2wl8KGtAX6icwLN97yP9TiZhBzfU
         T28LwwcONbC6wBcgmlo1OOvEaysYn2j+sQ+lMAlofs77fDVOrRbPX5A3ymJ0JrcB80HB
         O2s9dCeWgW6aPKGIigZ2VvJX114JaeHhgsKUFwR3Zb6eZI9SyPHhJMt77dwri7ybaew0
         2D3UEWbSv4lO0px0AaI/+dYZAoeOKi1BaZBraajr889LR3UTo2KnYVFTx1l7EXKk8W8q
         wguWNl9x8lawcMff+HSmtUrOzOiH0Vix5LXY9ptB9E3Z/FiH9YUhfjRRW09DtrqyPv84
         qabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        fh=DwbRA0qRcaBmDOYeIJJpxd4lLMl2fjMq0zThG2Vu4OY=;
        b=gBWILxOOV5d8I8WwNB875wo3/9vU8OEKpZURBWIn9P2WQ19QbIeEH19Ya4KFCZXa7l
         aBzVO7leNYb/C0UgDHu/eRupeXQ34vRbFaykvDVNdhA9t3dUWlqZp6jA6rCeZYsAekv1
         S/AB3mj9Z/n0Krsl7Osh8TW0fL/yF5QuwxQdZj+SbWlJcxzxImC1PR3AYKf70Bj+m4KH
         8PH8XKI2WTexekSZPPN2G6JTix/cLxn7cCw9YwaYXp9CyeEqHxbY9YvG9GIoKbO+u2WV
         vxf8Gs7pCR60oM1TA9w/GHmIv87XRfy5rS4EXz3+keRN2EKxtjFnF6XBNouAa1GIinK+
         W7aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345001; x=1787949801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        b=fLFeuiBYTNvAsBmGyMGwE3vef/9iWA7vgmQAmIXESvQxpD/12tCazkQ+ByOqTbI+Dm
         fdkmtd2/9aU5L9hwQJssfP3bt09DXsQhT3R39hOCZv7QFG13vU9ib4/mCMfgk1FLrXX0
         YXNwjKoVptqxQ/7blYdeD8VpA5fIHoambdbrPLYqC0naPBlDbw8k8A1nWCateUHCuOZU
         /YbKSU7vpzYSQlJymd1Z6IjFkKRetXMj4fXaRA2q6Qi+cYpeMlr4uNxENwmV5CmyVlIA
         sfZpU0GjNqHf5z1AahrKA3y8WVpLuKfFnXan/Q0WT+7CRLdr2J/R8fSclBUGPF4+ho/K
         5Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345001; x=1787949801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        b=ZnEU4r9jVsRnCFAByuVVJvLSMpw9A23zReMh0p/HGrSIhnZDvAea8kf3IaiU0a2x87
         pi2z72YYmcggp7GYZIr9iQuVcDhMr/aO07nOC8zGwZlBfZrPG3UkdPiAfAPYYM0Tb7Z/
         7QobrVR3ebg2q4Ml/DglD0AGY2HSd15eoHNVY4DDJ5YGh//Qr2LMTest/s0aSYISQQFg
         N9brWFcA9Sr8Labz+oXk7S1GRTstXFj9JXjbln7nouIFQAUgwbKcBT0BGfoWplSMut2U
         B8O3WG4l0Zm/6rrg4o9h8ZbxUVXTxrgieJQd8rVuTB8AiXbG1RK4AVMU1zj2qVRlFB4y
         fTRQ==
X-Gm-Message-State: AFuF++ms4O6jv8RyrVq5LaLnOOnTiHuK/OL5cp8sjKJCFyBV28YFZwXo
	rkPrktmia48hkZ7rPlMMqDDFCLpNhMjK+FtRDd4Jv+pNSB5kZm5tizEWGmHs6XwiDJqFPp5EkRM
	gYaYOMZ6vl6Qp6SifPyBqSIl/qL1ANrY=
X-Gm-Gg: AR+sD10aeXc6AXIn0KGZ4q1Y0Hf534yzHMowuAMaNWfiW20kl9kOFY+A3SzcR6F0ccG
	XB++ZHFQZF8loxITk5X7RVzx1whMzx+sMAmXTHxHtKd/YtIal34KPMb+ouR8Z+jvdKVZK30jSGb
	VRazztAsoxbeqFEC/7OW1O+kGwXEnsX57VQn0kUQGCJ5+9HwsGovPUjU1hQyYE8JafvlJWucfyb
	eKr6ssxC3rEJmStzbUZoVqnjy91zfqRsg/HYJWo6B2VIG6ZRVUL4HQSr1eHVh4meK7u7VZqWq74
	rojHoJTSDoym732z4VtuBuXFLDSOZRLNKIyL9x/0errSWNXw9stf4hz7VVTwL/3eYQQFGsjAUw2
	cuP2F7mHmMvJFUk4PEXXj+28Xu8K1kQ==
X-Received: by 2002:a05:6000:2507:b0:482:b823:38aa with SMTP id
 ffacd0b85a97d-482c0b91fbbmr12887893f8f.14.1787345000792; Fri, 21 Aug 2026
 13:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821140719.EBEDC1F000E9@smtp.kernel.org> <aohsOSu0-bfMuxoi@ninjato>
In-Reply-To: <aohsOSu0-bfMuxoi@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:42:54 +0100
X-Gm-Features: AcwNN1UdltYu7R3EkacW-3NdjmnrTvbGQkZDbs3Dg4tohncIALL7tiw1ZOJi6wU
Message-ID: <CA+V-a8vfo416RdWWaAoijRb7T9oRtPmwJM9Zcqhx4NdrN9YxFw@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] rtc: rzn1: Drop trailing comma from OF match
 table sentinel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Aug 21, 2026 at 4:18=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > -   {},
> > > +   {}
> >
> > [Severity: Low]
> > This isn't a bug, but the commit message claims to mark it explicitly a=
s the
> > sentinel. Should there be a /* sentinel */ comment added here to match =
the
> > description in the commit message?
>
> True that. In v4 you already had this.
>
Ouch that got dropped while rebasing. Ill add it back.

Cheers,
Prabhakar
