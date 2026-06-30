Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B73F4845
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815420; cv=none; b=dmFvXEqdePi17hppyWcn7nIii6xghsVN88hfbvUCXbNf3LPsauFrulrDDy+Z6gYcG8pGpI5RsZWLe/tc6jQ2J5sDFqOA5yRFS/j9PwEjPHOm9EHRHIaY7/mn5ege7pHhq/oQkIklEwuGkTUXqSMlf4Ee8NlGVqamh1lGYMLZ5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815420; c=relaxed/simple;
	bh=szU59hRjxNggmvqXcXeIzPI3Ogt4CFjbpOmT1DpW5Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hRb+pR41pnxEDq3CzpgQdr+4w5iGNkAFwp5O5E6Exw2/WAo8OBbjOYqc3x7Wu+63SNCqMy+XJmNs9sdsFUfKtTz+yhCiG8Mz2V59299spZzuFmqe5Xe2SiB6SbCsacGEApKfodIhnMDm5gcDVAy/De7EPWcj1+wcp55g6XHktlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATzHyXVo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATzHyXVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782815417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rt+GIzX8xwbGOeudcihqYde9U4BtzFfzJJUO9ZPZWtM=;
	b=ATzHyXVoEGRnKPCkM/zCdXziZjmeIl/anGNO8u3O6XfmnNsVhHK5v9u5W2wqXGjjZUsidm
	/SFKBdWdCN+WqxzYqj5E0XleqdREUAvzGTEnHcT06RYA+sdu1TxhGSqliCJKSx5TkjJne6
	Pon4Ji4SJidcbbB796246CImGHg2AZ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-CusS0v3IO8ucsPPMmVvxHg-1; Tue, 30 Jun 2026 06:30:15 -0400
X-MC-Unique: CusS0v3IO8ucsPPMmVvxHg-1
X-Mimecast-MFC-AGG-ID: CusS0v3IO8ucsPPMmVvxHg_1782815415
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493a7fa8481so3458075e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 03:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815414; x=1783420214;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt+GIzX8xwbGOeudcihqYde9U4BtzFfzJJUO9ZPZWtM=;
        b=qRF5X2XqtYKLGFPCyKfPPAThgPXjbz6XEYH4ZBKoix+iWShlciw99NROf3wGOQofIX
         3eD4fQJbauSYnAA7kV1ojr0xiItq1eD9OqQQG8zsoKBuW9v9aEIFHpULpXN5nUzXgRRm
         28ggIycH3jBXWIYIj/HkIQWBsj+C3UBhRCwtWpJt43Aen1EwV7XhhULQY3fY+O2zuXVP
         sKlIli76L+NncEn+AoMMMcrcECKAO2Utpfjgq5bJSVKc9AydTBeyGRVwIikitR9/8L20
         W/TGS3h3tDWl8n6QjcxVAZSz4NLCGSwqWAvP4B7OmdTjmhV7NjEMaLp+b2vrpJ1vSzC7
         LW/g==
X-Forwarded-Encrypted: i=1; AHgh+RprDsfc9JpzXzLcdapf/yRR+PIX0D7bWzwG2HkSt5cF8l2BSkif2uywOOMfldMh+lefqzRjhyaiwcAbSN4YyYo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtZaW+/lZVa++YNhl9+sV908mLqqujn/98YxjZymc8V/aTffJ+
	nqJ//j7MpI3RpCb1G03bZfGO3mj8UOIAAhcqdvT4ZsMv9NIUOezGf4LO3MZfku24BvBRaYWG971
	wX9I2THW0GNMjseONuF4jvM04X7CUzQwKnIVbv4tSTfblKTowR3BjeVbqUDJRGSQs78ZQhQ==
X-Gm-Gg: AfdE7cl46mNJy9eGdKnhYgRm5arkCTH1wKd6LP14LGV2nkNaGgSlhyZMJ9+a4wycUI0
	0R1yS5ggvGPW0m82Iwz2tqRkHeqNOpbuAnXE+1+4jZPCGfR2ZTgh4ZEL919/TtvPfwH9BOlltBP
	aYdV6WS83XL1XCadAi1vsOkULKEeOmyOIIyOyDBQy/ZJB6RYTanyxYY5rnCqwQ8C1rnNrgY0CbM
	dWlnTWjixce64EINyaNIayzvso1rxRE704oihy6382wsyA8U3XXJIzOQPw81apRsTywTH096WQl
	4fFIV06rGFggkc4Kar6/QTTbLmwQCMoGIe6y1AXsOMoWRfeNps2850hiacAHSJWQeGMAMrqtgaG
	cSjeUJnKcZW5645yngpW2XnJc1gBOI9UU4gExxBIvhLK38RN2oMIikLk=
X-Received: by 2002:a05:6000:4a13:b0:472:e43b:5e8c with SMTP id ffacd0b85a97d-475dff5e567mr2010142f8f.20.1782815414192;
        Tue, 30 Jun 2026 03:30:14 -0700 (PDT)
X-Received: by 2002:a05:6000:4a13:b0:472:e43b:5e8c with SMTP id ffacd0b85a97d-475dff5e567mr2010076f8f.20.1782815413538;
        Tue, 30 Jun 2026 03:30:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm6895099f8f.1.2026.06.30.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:30:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sashiko-reviews@lists.linux.dev, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 1/3] drm/ssd130x: fix column and row end address in
 partial updates for ssd132x
In-Reply-To: <20260630095600.8392-1-amit.barzilai22@gmail.com>
References: <87mrwdd8t5.fsf@ocarina.mail-host-address-is-not-set>
 <20260630095600.8392-1-amit.barzilai22@gmail.com>
Date: Tue, 30 Jun 2026 12:30:11 +0200
Message-ID: <87echococs.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v4QhhVD1iDz82Y2iivILrMNibw990tMpXqs_WBY-fRc_1782815415
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> Javier Martinez Canillas <javierm@redhat.com> writes:
>> Sorry, I was on PTO and couldn't take a look to your series. I plan to do
>> it this week.
>
> Thank you for the update and there is no need to apologize.
>
>> One question, though. How did you find these issues and came up with the
>> fixes ?
>>
>> It was just reading the code and the datasheets or were the issues (and
>> fixes?) identified by an LLM? If the latter, then you need to add an
>> Assisted-by tag to your pa+tches.
>
> I found the bug and solution while debugging the ssd1351 extention to ssd130x.
> I used an LLM to make sure my patches made sense and to recheck my patch logically
> and I wasn't sure whether that was enough to warrant the tag.

That's a good question. I don't really know to be honest.

If was only to review your manually written changes then I guess there's
no need to add the tag.

> I'll submit a v2 of this series with the tag - let me know if you'd prefer it handled
> differently.
>

Up to you. As said, I don't know were we draw the line so I will let you decide
if you want a v2 with the tags.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

