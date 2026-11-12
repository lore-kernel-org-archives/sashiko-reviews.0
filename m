Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501242;
	b=qyfJoAzh6SzzCjC5eoHB1F5mEHEBeBSmhDPw6431FcIGf+V2k1Uay0XfVwbUEZh6QA47
	 Ui76dP521GsZ5QBm52MZ7mudljuczgMyqGpXB6zh9/3bpPlwzUvrauMKpgG+7iAfobBcz
	 4HHCHa7l9nWDrITs0sLDmuI2BRttFN+bCV/Cx2IMJj97q2FPJ9r7alEpcOccN8heG3R1c
	 TkCv5ZZ/wc2ddgIkzsV4GjHg/2DLw6uqoNMWNUP380l3JTLpKAx0dbxRtffF9Ca6MUTiI
	 XWHgsaYuVmNBtPrDJAruOg/jyXuo+Xy2Ya+oFEHeug7raO9gwtdE7Pia7oiY3gm0jmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
	b=VgwbIZ4SCgIVmPYcx4XmEzdUntJ6hB26jzNy+oBm712H4uY/hzX1Oh3evOXtuOdrUFPl
	 hGOVU82yBv/Wieri2Y/7SqnX+NNlE+ZeULWk475DGxklznB8w6N0EQr4CBsgdXBgMaVPc
	 LJWbTlXgHpeQtOij7ZaH/zdQ5+XBeIWUMk+VuinVrDUZvpTg3Zx8H5Ue8KvbHjoMocpy+
	 lGLGIvWAOVnEnTBkEANxslTWECB/C1JHIYnRi9ZlqPHfzzh5TUg8ZKtZC+4jgJyX2RMEE
	 FLX8BIURbCCOuG6m2KTmXlqaNVfA+SYM5WMgDj9NBkPEYXqfdnk04CsJuCe2azoc2Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPLe7GWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6CC606A896
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 16:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6CC606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPLe7GWY
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54dab123e42so3002581cf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 08:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501241; cv=none;
        d=google.com; s=arc-20260327;
        b=Min8aZQhgZujnP3NDBFJLob9sYHOSWF9T6taV6Uwva3M31Ntop4FwjWsdYZYWOeJ10
         qq7aMCZrfWUayLB6T6r22+Gt7oCM2ayb1Ffhb0euED9X+DW/vOdKYDidLz9m7dHTHqg/
         vp2Y94qAAHTs1fhHbdSiKLfDED71XsF+8nvY1W3Pn2jbZI1A4VyXzv3cUNJvlyhvxDVb
         /Z9/LkSWsOJquliWdQyQNJOr7IMn2ryr81jc8LFjndJrc3/ixo2Re/A05QPGoWpwfRwD
         mbeQ/aAq1rkPmE5eL9bU9PuOd8G4ElrOKpK7Xn7DKvhQsFRXtpLZg/bavQzCwU9zE8j1
         gYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=cnXVW/CtZIgfKsAwEzja0QSbhAO02ta6m5Daeuaki2Hczi6Zk9QEoOY3sWQXfkKmwH
         N+7k3y3AB8MQWwyvI54U/lg8qYXHJHud9iTpeVI3XfDS6hwgOcD/Rm10UHpp/jYlKI1a
         iNcYyt6Uoc8lx/Zk2gjPKViS0XeoYvD149vAqlA0AT5d7ZWtrTkxUXwHll3B6XO4eXSU
         RdoKu2S5W4MR3XpXowJ6DmVb/kdFOr5vnRYHqpvVwT3382buuXwmawv63n+9eGTnnBnj
         Ygoq2KX1vyqj34jQsN9RJ7b+6jPqRgv++92Bw66j3EWB7xqWyrSYiQW9sHWVaTKQ5Gtz
         atKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501241; x=1795106041; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        b=XPLe7GWYry5/+sU6ztV5sjsThkjhzYJXBl0hXrlz28GgwulPft85NJhR23CMFLe6aG
         PME5Xb6GYUQ055xdRbio5zG5KgjLx+D3DLXj5EIiFTfho734enwqg4q4e/LdgfUmQKUY
         LUI9BQ54fhIp/xe1d4tmoagZ5nWXT+jLc17k71a0GHfpyDWpZifjcAF71aOK0DsY5rGM
         97ZQYyxu/QSG/7jwwpDnqzbmJ6CZBEz0Vafczo5RogMNJRvzJ8bkvRcJEyfxBsHOdxzJ
         S3sggtRoBlHMCBgOU21E5OfgpfZ5AFXS3g95k7XilAEVA/fOZ+iYzXI1gdUdrPND5DEg
         M3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501241; x=1795106041;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        b=iG8IBhbUp7hYEkpJZmVkxbxnhw0Xh5G/cz7jqBDwYBtPyiDTSO9XVHKHBI8Kfj+uwX
         qLDB6NBKEmnKFcwqr65QxtWFa4jWj3tAg34GHCOlgiOIw9b6IoEGlYXZ+2ryAppfjEvP
         VljjD4UKqFgQi6FIC0tVsaKhNBg3NhNc+3TzlJLSGs9twI1+RtGmod+6vH4tk7GiER8G
         iIViXWwIqOL8zysddo0KBxMlLS3nEukDUlVCZv0qEAfJWft0BczKyXUMx8hfpV/7QHPX
         miARKs595BdfDz9OjVkIozNaZlFd1ynyWfcWzHDuZO7AlxdnCHQ1flzjPd5fQIx8THpT
         j5kA==
X-Gm-Message-State: APuU4Z/wurbu5T8feA+4i9U1M+GlH2L1qtcnlzkGIgg3C+QxblPEDM0Z
	BaueHSkSWuQhtpuP3hoHUXqH2s7d2YpinEtW5s5OVqT9MJVkNgDHbIsX28JEteSSaBJD0FehHkV
	lqFV+8IFtb37m73XpkurmJgeD4cjBzsYHrLrL7SzoYw==
X-Gm-Gg: AYBFou2n+n5l3XXoVk5cBv45NCwMVwNaEnwCJkkRaNFwwHnZqDmYaxjuDPed+JXt8Vk
	frggNOLzHzEBHdPPNqCDig8hy8RH8+ytZXLwQ1W7tZJNiBTS3k5vao2kxXeiDIco2Rf5Uy4r3YZ
	gd73E2/PJ8p1e/M4PimqLRmtr0EiENrtXq65RTptIQzgTyw3UBp9BOYkA3ZHysZ9arkQPmHU8vM
	fo+/kHjdWEeEp4LXb1yOJIi2x9ubEXHm2rW6+bZC7Xd/zI9dsEv847ijWzGt4oGLOH/sPTOb0pu
	hvxy4P9XrtaXhJLI2obgukuh4fYYiqjV9E2hibjGIwwjJqQngOnxzx80xmmIfhKlFQ8CJW068QE
	yEFWAm9lYy6j4rfflc4alHUfX9GKiJ1W4S7kfAw==
X-Received: by 2002:ad4:5d69:0:b0:91e:cba3:43c1 with SMTP id
 6a1803df08f44-91f041ce878mr141426566d6.4.1794501240930; Thu, 12 Nov 2026
 08:34:00 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-2-lui2012qwq@gmail.com>
 <sashiko-outbox-211493@kernel.org>
In-Reply-To: <sashiko-outbox-211493@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Fri, 13 Nov 2026 00:33:48 +0800
X-Gm-Features: AclHuK8V5VMmiaN-I58vSc2_c6jPp-maU1OVmpTHdynIFXySAJKBi6nA1SaldYk
Message-ID: <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, f730f205cc51 is the right one. I'll carry the corrected Fixes
tag if the series needs a respin.
