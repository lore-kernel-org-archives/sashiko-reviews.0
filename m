Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8B24A2072
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819058; cv=none; b=N++YZlfO51D+ITrUz5/weXtBq8kIhZGH4LnkSpBFIXGqkBMUNH3e8lHYdgQfO6456dLG4tgWZ6Em3EOC2w5cch+4Q/N99sbowaNKSFiMbi/ZYNklsu4kq4phnFWK8Ve/nK2/caMo4AZxdkYrFhZAt+XHWSLq7HeqmCPSE5Nt3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819058; c=relaxed/simple;
	bh=72GZy6Rk/xg+Mw6R95RKY9Bd5qAEshpDaKWgQB9kw6U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YJLhQjVVHlDqyU2VnXfvyrishZy43GAev7PpAvPXQ9SwIveMtkMNc8mh61rFasFrEt4c0OJlRq0G0X0kSeJkkBc8+6V0erAeLGyU+WpQSGFSCoeGiav5kouS2BS6ivUUDN4otW73SLV20K73CYlxDACkAG3HfnYCyzqh0xa11Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZQYJS4W5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZQYJS4W5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1878943f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791819055; x=1792423855; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ba3+jNOzbQ3vFxy0wZp3OiJdmmySM4+d1fubwhelRqY=;
        b=ZQYJS4W58OULeCEI4cXeDVF8Mqf8dgf9SS/siMWzufoOdSneTbDi0SwUET7OpVnDJ2
         JOdZ4rxOOAfPUyrb+BF6VpKXUCOtvKdJec8aB6Tihbilt2pv72zxm993NxqUMmXuX5yH
         6V4C89SiAv312RmLB2sPxVGeYTGMzbXFdPSLmaZ3pYnHIEiJpxnJPbkZZMh36xu0a+er
         KLMM91XdPEJ5G5f84m1V9fBEjSOROvO98YaHEEHjGUWFLQg2+r9rpQ5UQ+tSsped6XgK
         nXvThaRsYsMN0iDR4ft0+gMVb3c30MBb/F5taQ9H5w0M53g7GBfw2K+drK2cQ6nUUGue
         YQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819055; x=1792423855;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba3+jNOzbQ3vFxy0wZp3OiJdmmySM4+d1fubwhelRqY=;
        b=fjOOv43JMr4PQvtCDfJWSCSDOdm3VaXuqONj0ZQA6xRjmfREqC/GoXycl7RXarGGmb
         2rbsmbr1S2N5kyX0eYsIHVyMkDOIUDTF7sfTugcxP+8vvIinhHZ72GE32IfHn9TMg0Eo
         MgWzXkcBLnK0I/HKIduix/pR1z+RK/Ln4bkXSQxGRyOfxTefo6g37LVd3cQc3wf4KT4o
         Rm5TxucrzTHj1w5L/yLsFC/BU+PzdcujrJNtu36VDS5naEpJ3QMfFleVIl8aF2OTCOyq
         XsRt73jeTJGK18TjahYftGuyjdAc0DuATvuJ66kHkxxlx/mMWKUE4HQXYnTjZ2t4ErJn
         2KJA==
X-Forwarded-Encrypted: i=1; AKwUvBx6vUdVxS+3P41d6CswmqcRa7NTB0stN5xn6P12YxdBtPO7VI2oN1t/P4wXAuayGsubF0js66OIuARC3RupxTE=@lists.linux.dev
X-Gm-Message-State: AFq9FYI5H1su62wK5uXj2JZQPydHFKjviyd5OyMdiptK8qw8/B9CxFjG
	Kq3B9HYpi4l3Zi4MLAa4zI9RNK0J7Frv4Z2/7LsklMLplJojZO0FralVw5JTzRjdg88=
X-Gm-Gg: AYBFou1jpdWCyxffj3To79b4ia/oPaVUoSZHfP4tEPZzBVxZ3y0vowGDPxo+v57bjeN
	e+wwDFqUWlEzA1ZOOMKE/fFpYpDkRLz+4jx1t0gXSxLyi1xp7dOsOS+YTtgAiS2WD1/9lpbzdsm
	wLLzsBeX9gn2rBCZsrdJfq8acVb06zNDjC8sMPSOY/qLEirV4F7KyuRUT3n8evS+yvY9oWkh8Gr
	TzSsmaTG0hj32U3JevLtfvkVRfSnK8SGIK4i2lAWvD0WW3dz4eyC7LnxLVih1VvY22HcX6vaRS+
	apsv8AEA4r3mxDDLwEqctwYysvPFcsVxgZRIXH6MAC8F8vCIkREjMDyD+SORB3enko3Lkzx80gt
	KX87JfO7ELD8B7K7UgoybbsoCA40a7ElYjKNJbMgQ/Z7VBo+sUm2UxeQ7dgDW2cw0Z6ud4CK35Q
	8XssZmE4u8zN5ikbUzdjSxvO2ZIZMW6kHp0LFgusij2uAkggiFPXVH6BkQWri0RoQCQYNeSYzuB
	rtrnSoAaAfpANUCN+PS0v8OtN2W
X-Received: by 2002:a05:6000:1789:b0:48d:cbfb:d7b with SMTP id ffacd0b85a97d-48dcbfb0f48mr10990934f8f.5.1791819054737;
        Mon, 12 Oct 2026 08:30:54 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm64048f8f.24.2026.10.12.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <87cxtni7m6.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
 <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
 <87cxtni7m6.fsf@bootlin.com>
Date: Mon, 12 Oct 2026 17:30:49 +0200
Message-Id: <179181904945.33566.17882786294681341398.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72GZy6Rk/xg+Mw6R95RKY9Bd5qAEshpDaKWgQB9kw6U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFln/mpO6fv+//4847fzDVy2+/AkinE+m8ZovlXu7bQNH
 x5dOru8uaOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQATMbZi+MXE6pzSI3rfiNlK
 5lEg++Zza0wOKa99OGlj/k0VOX3jiBCGfxqrf18O1HWNTPu74aek7b1y1Z0bEh4fCudRze48UVr
 aygoA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-06 09:57 +0200, Miquel Raynal wrote:
> On 05/10/2026 at 11:12:35 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> >> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
> >>
> >>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
> >>> during probe
> >>
> >> There is a single clock controller. Should never be a problem. I can
> >> certainly move it in to more local scope if someone asks, but it's not
> >> practically needed.
> >
> > I may be missing something key here but why is not in your defined
> > indexes like the rest of the clocks ?
> 
> SYSPLL and its parent (HXT_GATE) are in the hws[] array. Are you
> suggesting to use the hw_clk pointer directly there instead of using the
> parent data structure as an envelope? Because the issue raised is the
> global definition of the struct clk_parent_data and then its
> modification (since I need to reference the hws[SYSPLL] pointer inside).

The problem sashiko is pointing at is that you are creating a global and then use
it as a local variable, just assigning the the .hw

So 2 possibilities:
* You just need the .hw then I don't really get why you are doing it differently
  for this clock ?
* OR, this is one of the those clock where you want to check DT first then
  fallback to a fixed clock, then yes you need parent_data. don't forget
  the fw_name (which I did not see here) and use a local variable for that,
  not a global

Did I miss something ?

-- 
Jerome

