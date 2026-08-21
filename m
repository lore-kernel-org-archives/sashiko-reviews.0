Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136FB37F327
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787335767; cv=none; b=BRCdbPHxvY0FscE9AIw++VN9CF/iJZyR8f/5kCEEG+w42yG+VJibbIituwKLKKoMU/yKH2RolyBaDzgJAegIdp3NViHuDJAKNd5GYpgGGs98i/j8cxrjjZVMUHenVpLo99e3y3dl0p9i4qmn6UT2qtSUPJ9Eos2m9deViHa2swA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787335767; c=relaxed/simple;
	bh=fRzzRtBhBuT3AN+u+UFCcOVfzEwr+BQb00hG+K7UXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IqloCbZR9JG/KnycPqJKplwNygI1qxb1AQc9h2FRXMAxvcV7L2k4tzw+oln+1HP8FtnRVJOCM7UwvekZyal4uJYGEBu8hv4mGOVjI5eMA0SNi6wMJgf2XB2gW0TK1uThLBWWaCsYEMCWQt2QTfvqK1J/MsnoUsucXkYbeA3WKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guhG9YPI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guhG9YPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787335765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NGNHCG2S90dL1ilUQqiDCnuACxnKluxw/vvCoZVLc+k=;
	b=guhG9YPIstd+M2qESwks4jJJJ2Ar8PYSeCUly5BG6TjHPkXm2X9DCyLNNLkU32cSgrrnK4
	Umc7FhkdM/jqDK7iS7ZGDYWkBWhEuz/t+ghd8TAUA7+6KyLIiWyrRdWAMQFZyzCi5+3kb5
	8i+RwxsF3YUeBuXsW48ULvQ/PeAJwhw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-ly2Je03eOHyj9tIAQFEfrg-1; Fri, 21 Aug 2026 14:09:18 -0400
X-MC-Unique: ly2Je03eOHyj9tIAQFEfrg-1
X-Mimecast-MFC-AGG-ID: ly2Je03eOHyj9tIAQFEfrg_1787335758
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d9cef8d15so22068971cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 11:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335758; x=1787940558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGNHCG2S90dL1ilUQqiDCnuACxnKluxw/vvCoZVLc+k=;
        b=M88lttiOIzG4Gr9s4Y9nGUhKRTDT+RJ/3iDDWAdTVGlegTmbLWHZNBtBIm3571cDpE
         wCaMZ2rZJWDe6dYR0atpPg5zqsXfT6TU3FdRkXr/hqGpS6+Jp+x6Hcizw33e03aO4Qjy
         yQHLvA24WHFg3Jzaw/fyT8PBcSKaEQRy96JlcwuSSGzyIAQTz3uf7fhx2D7fDs3XqlsA
         yQd6//URkOy55lWxK40qR77t7XL6XYJBPcu2WRdd3n0vDwa7+MIONiH+7CwS4eHEQsZc
         iF6/h0IKliVF9PWfMynXSxIXsCX7zpy2geDj728BYV3lcZCIShy5ByjyU6mmO4BK3UrH
         gREw==
X-Gm-Message-State: AFuF++lM+/94Bo3Nj3F+I1+mw+QBy+5IxSHulHMV48hTYU+FXkq1Zr++
	mwsHPTRyij9Vn4zxSef967rKqdqcRV/VzGIMZtgV4noLUczKLx6BOeyRCRIa80XRYIQD6B+Lrey
	MWHuVqE4E/RynM84LAeFuOlbPRXNgFWiVfitI4omivQLGGwgIk24cXHRdeLSquxV5xrrJyA==
X-Gm-Gg: AR+sD12m6P3wphdYw7yxQEg+A7zK75NUZQzHjwT4kXylNUvAg1gQRA09mGgeVtLy2NG
	u0ccQvCtUbKyC7BciYIWqN/VRHp03mdYYo26GnwKCd5WZUcbd6QCQ1OJK8KC8iGJgEY3vd1xwUg
	HggZ9I5sflTeJbx+d+rzsEIQTYZjXbJzy68AmxiqPhqsrE9EPX+fS6crVukT3xuXc5HpoFOJSfV
	d6Cycy0Nh0aqznGDcvTBcRX1VWagt+wft48PrhCQHbvyZZNxLoMMxxzv2R0T/Kq/AAHmL5iPpZL
	oOsALVFurCkc7qRNiAFefm8C47hwTeXXWTSkpcQR6Qz8y3KQ6puleMp0GTonqdNKYdfQw6Jv3mb
	VjlApw4rAgQ==
X-Received: by 2002:ac8:598a:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-52df5732c7amr77456061cf.11.1787335758164;
        Fri, 21 Aug 2026 11:09:18 -0700 (PDT)
X-Received: by 2002:ac8:598a:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-52df5732c7amr77455561cf.11.1787335757792;
        Fri, 21 Aug 2026 11:09:17 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm97951cf.15.2026.08.21.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:09:16 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:09:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Message-ID: <aoiUSeZNmbeuWnol@rh-jkangas-kernel>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
 <20260820132304.2B1BA1F00A3A@smtp.kernel.org>
 <d1b91675-7675-4b6c-821b-464e8f113144@roeck-us.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d1b91675-7675-4b6c-821b-464e8f113144@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2uYd0cjn30pASZ6seR-di_j_jekBFFbQWS1BQVdtX7U_1787335758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

On Fri, Aug 21, 2026 at 09:58:14AM -0700, Guenter Roeck wrote:
> Jared,
> 
> On 8/20/26 06:23, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Writing 0 to an inactive alert limit unintentionally clears the currently active alert, breaking the newly introduced alarm decoupling.
> > [snip]
> > 
> > [Severity: High]
> > Will this unintentionally disable active alerts if a 0 is written to an
> > inactive alert?
> > 
> > Because the read side was updated in this patch to return 0 for inactive
> > alerts, state restoration tools might now read 0 for an inactive alert and
> > subsequently write 0 back to it during initialization.
> > 
> > When ina226_alert_limit_write() is called with val == 0 for that inactive
> > alert, the code just before this hunk unconditionally clears the hardware
> > mask and the newly added line sets data->active_alert = INA2XX_ALERT_NONE.
> > 
> > Since val is 0, the if (val) block is bypassed, leaving all alerts
> > disabled. This seems to allow writes to an inactive alert to silently
> > disable the currently active alert.
> > 
> > Does this function need an early return or guard to ignore writes of 0
> > if the alert being written to is already inactive?
> > 
> Is that a valid concern ?

I don't believe so; this is documented behavior in
Documentation/hwmon/ina2xx.rst:

    Writing 0 to any `*crit` setting clears all `*crit` settings and
    alarms.

I might be gazing into the AI crystal ball a bit too deeply, but I think
a secondary concern suggested in the report is that a tool could read
all limits and later write them back in a way that ends with a zero
write, which would disable an active alert. This is pre-existing
behavior though, and I think that would be more of a script bug due to
the current documentation.

Best,
Jared

> 
> Thanks,
> Guenter
> 

