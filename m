Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81078396585
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251361; cv=pass; b=VkcNh52fFzVyFvmJKZhAuguqFjmh3WrBunXCOJKs7FSFYWKzgr02QirAg2VeuHwM14IS0zqKVLZKQLQB5/qyTJCoiRAEPgV61j+uJVPsmCiRTJhR30ifMJ0JgjBB81/tt8ykfldgQK7LCwZ+oKVFM1o1tfvxV8eKommroDadvo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251361; c=relaxed/simple;
	bh=60Gy80AqDCDF922FU4MPaATM1vUz9hD66trB84dzQvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLbeXn3c2sq0U3yyGjFHcY6ajvMCvSZxO3bY3YyJFkYuhSWuHZuuiZrDzHfJKydK7TKmlG1cqAdRmglxG0bwjnxvSb9ZlBdo9n5nUf9QahN3bU3Hay2dSJ5k1boysb88cPwDyctPPwYYGwbTmkCvLJ1NjXwZiHD9LcV1RHBoXgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQktbIgH; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQktbIgH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so514645e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 11:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251357; cv=none;
        d=google.com; s=arc-20260327;
        b=XDGEbQhdrVoGCozLDAXHid5tWyns/CRpCH/PR5BXBcDFm34G6vrE8QhmxEIwBWG/X1
         Kp/N4cgydFlJLCnYaIVKATySGkl6rVDupsVsxpDzuPvZ4ldl5czalhD3pUR7KJjQjpis
         vS5d125rcLCSRjzEeasGciatkY4OqQaTTgVcmb51iV5ExEwMvR32eXI+EPGFye/0aM3z
         ZLhhwXen9qUTs7hpBbNbmEQdSaQ0biGQsAb+OInQtjlmpbTwaFx2rK19IUzxcz3ThMuV
         DdXIauGpGgQkojN7gglUUSWsuSS6w3bk9hH5DKolsubWXKABHEzF6m5SUt++LTFby8aX
         wdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        fh=VzOA4vMZ0hs7z58xCOIebYw0hsP5O335eG5uln2UTDw=;
        b=PUeDzKXVCE/KdQWX+B7QNdWpeaS1QA9ttyDtjT6VJrBdCkTxurtrL5o985UEtDtWjQ
         Cu7s2EQyrAwP5+pdN+yxZsFrSQ8acjh/Yj5x2K/nmVFL9lvLw7BtVw24KItx9ML6HOU4
         gmUelLffmOPku26Rv5dO9mDtXq4LMt2XG2LrrrwuPIc4/4bjSF07JYXbAuPIyFprLS/G
         pR++Erc+ibDBSuSnWbH1mRdy9h2J+Faaqj78wZGCW23rrhPtnIsBdBsV/uBwFlXUwh5x
         2AprNe4MJ/L0I+atLP6nvu2zLNiKH4x9o3lMopHIGM/iUgM8EuWqCjeZm2CQjgc99u30
         oUHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251357; x=1787856157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        b=oQktbIgHr2snaZvVm1Xd8sTaSBZtgI1xLDy6gddXj3PcI857nkw6vUxf9uhR7zLjBE
         9auRZ7XVlgD4lmuYetz5isLURwV7oybRl2ydb+StMjC+ZHkjCo1URiR02wW4VIlc7f3x
         YmoMZVp4nIZhTFL5F0UMRm7zPn41ewq2/LzIcxC727pWs8KT+8kvKOwqrHZPCvg9k4LY
         ahEcu3TYPvhZNPYGz3WHtOSdpSCKArGVzuJlcsG2KSPKZkLwJ0jKkCDA23T/zPy6ud6E
         xIFCj5NFUtx5jmGC7GUaxXW+boep0XsGNXXaGwED7tcGWsvrvtJCCIpU2WCXa7ixG/l3
         T9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251357; x=1787856157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFqOYk3/urySuBJFd4x7IjPcpec6+kX2wN+yqUz6ICg=;
        b=PpPT2pIn7rJ7GwZBweIZOd2HNiBA1twA/Yn1zKiiwDBeMBYbZAETYaJhZzBc5QSYUh
         1T2X24sJa0+wkvSd5TdggPIwZ1AiLv6+GOIif8RY2iQsqeOUg60mZDhOCBTowZFOFnBl
         lIFLG0itiQ/vcnoM75X/IXb9h+/5MKp1oxToa/yrMzYOnJeS9xA1e1DngpRKMp2JuOxu
         y+DuUsyWlMpsCl2wEZlkqcNoQQCIFUpSYqHnkexb6QlEE19/feXUTRpCQHa9CnZKpt8w
         D/uWrHhS2cmSWMega+poxbvSdgaWgMv0klZFDOkb6lHyPQTB9H6xN3ZfD55/IB+GJ4wh
         E8Hg==
X-Gm-Message-State: AOJu0Yyti+9tQ02cPbwwBuXlLzGNs2Qe8LYLqG0nKeGHhXvLHO8V8jGk
	QU/I4QEaXu9jbUt2XnDcp6Huag6uyiR38H0GoUCZHQZCDPtc3cU3/OfIWGlavAw7fLTUTfJGoan
	0rPEIutdNJsq9w6ZiXxac6sbSyQUtUq1aivpSit0=
X-Gm-Gg: AR+sD11L5+wNTvYU7ZqyxZwowVeoNQFFpN9fTO8tZOm2ZTx+U4EMwQt2208m3v3ucD7
	stoq8SN+5PI/8A8tqqIJY75oCtrYZ0lziMSlWiTwFMZ0vIxtS9NUkkPXAZh5Wf96w4Kvgtze8pp
	xhOBv+p0tBNwdNoss4SpZgXQ6YLVvat9KQ0bVwol+RVpOvPaTaOb6AEOsx58ko7kSc4hv8Kpqfb
	kVOD040SU2mCdgOd7wsJVDWlmKEn+K/tJst6VmtdxLgVbwUMJPnfOuZj8cN6DVbrkhMz05t2UGV
	Q3kqMbLKtjmM101U41dvuc5pXAlCJ2xmynk4D/awmEhYF4MvLQ15o+xUfYhLsISWheR4JJdLVEM
	4La49slpEYd5qapyQkppbqsvptBNFOaggUqBYlj4adAMXbA==
X-Received: by 2002:a05:600c:a102:b0:499:b81d:f580 with SMTP id
 5b1f17b1804b1-499b81df6a4mr20364505e9.2.1787251356632; Thu, 20 Aug 2026
 11:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105028.70F3A1F00A3A@smtp.kernel.org> <aoWqIxFRItjNu6uN@shikoro>
In-Reply-To: <aoWqIxFRItjNu6uN@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:42:09 +0100
X-Gm-Features: AcwNN1V8xZnCN6jYwc1rWmadht_y4_htRRVcU3U6J7W20ZY6lIODI2Uy1wnE-ec
Message-ID: <CA+V-a8vuA5EnPP8iCsCi2e3HY-qO6iNs=1bP-NnfQMDrrQK0vQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] rtc: rzn1: Fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:05=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: High]
> > This is a pre-existing issue, but can this sequence of register writes
> > trigger a spurious interrupt?
>
> I think this is true.
>
Agreed, I will add a patch to disable the interrupts before
programming the ALx registers.

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 44e8db466cb7..09631a3a5134 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -280,6 +280,11 @@ static int rzn1_rtc_set_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
        if (alarm > farest)
                return -ERANGE;

+       /* Disable alarm interrupts before reprogramming the alarm. */
+       ret =3D rzn1_rtc_alarm_irq_enable(dev, 0);
+       if (ret)
+               return ret;
+
        writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
        writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
        writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);

Cheers,
Prabhakar
