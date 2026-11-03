Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725582;
	b=3mRNW/N104sNOEwpia8xFkzd927alT6LbVpUjWkYEfyQXwf73eICuhfFC9p+dx39Vxci
	 HBJ3Y31QOTYxqPbg7h3l3dsu2rgGkon89OyDXrafxSITax9RWdzKudGLwzyTraswE+27n
	 mJl0+ErZS4kw+RM2B+S9E5lBrA0eD8ABZW4iE2Nld+KmSeflKZEEHfeOHNKiolr3I8ZZD
	 TPzI2NbIT9mYc5l9OrypWH6GOtHibI4QyYulKbNyfS1zFaNB1qF/f1w83+AF4oXsD1It4
	 x30XgKJPHc0sZlXVAnUx+Vl+Yb1NGdxGI8s84baZbi1X2t1zy83pfgdsP4rwmJQg+Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=59iGDOcne8oZ9CQ+nnh1K7KAR/IbzmaK4/PRVFsySsY=;
	b=sw7A4aFe+cl9j77rA3jJb85vImUk+EK9i85JOsvFmS7SYuaYc6iC/uuRCg8ZhcYs205M
	 w059Cq/b8uvkkF+PLIPwdIYm10MnEdSLfa/BvcV11YuMt4OKsVHp7PY/sZ1XRJba6oYcY
	 rJg/2yDO5P7MRY+9PVmxP8NNUROmYxZwbVRa26pRS0oeTTumrVs2aye8k4eoYnjKOr9IP
	 Tk+QM792xW5iID5sukFWR5gVZWKxJAKPRJbpNI4p6QDSSezQR3YTQJp9UXgpI8mZZ27Im
	 GHCpA1D3pj1/sK/MgFmGsCMYez4BMYgVvUAahpNTrr8d2B/hBI3tPxXYTPREObs28EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNzjxTwG;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B532606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B532606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNzjxTwG
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a17a332ecso6655454eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725581; x=1794330381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59iGDOcne8oZ9CQ+nnh1K7KAR/IbzmaK4/PRVFsySsY=;
        b=bNzjxTwGI6f8C/OPwA027SwOrhvDNd3HAYyHiK79zNbB1XmYVnA5/hvxK3VLyJtpk0
         Eu5943TXCvUm6K3QMe0DMKR9gMXBb/Mb+Dqnl+6UCf2oTKPsKBcFDYhuQ24QAnj94FwR
         S9cMpihlxfY2fv9SG5lBszhxWJaQQYYNeUStVuQLPrnh0DYj04xBfowQwnOdZmdAUipO
         8SssjfsdfKdAh1osZEA+Ih3HKW3b7wcgqu57/C0eA5JqIxZYwWoZqFeKAPa42bJCASJ7
         fM6Y+hGiMaQrQhS3LFTSEteIuMFuuL2eZPe8jPWyoUE2Yz8Yz+p59tSi6m3ZN5iqd7vs
         Qqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725581; x=1794330381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59iGDOcne8oZ9CQ+nnh1K7KAR/IbzmaK4/PRVFsySsY=;
        b=zV74u838jtqWZ2fFiYvzSmXgFDGMJylOMlw4rA//NgcIsoil34CtEdzwrOeHNFux0d
         dIbpWXHRz/GLJQe2EWDX029KwSvHPSCmtpWoN7zRowraPP0LivDV8qGP/gVmAgsSa1Pz
         ektWuFTTXqDw0XhiuQMF7dLDIu+YHAQ95YDeCdTgQ3SCM84khBHPSZDB+Rx6Y75dpz1o
         ESAt5xLkU5KAia0qQXFOMRxWpxB8G4OhSnXZUeopT6Q0JT2xQQkTnsbAIHs7NKuNocAS
         +DlNS+Pv/UjRGvLHrkY+Yr7H6JB3CcGc07us197QlLizPoziYv51wNxxJg9CwpsI8und
         c2VA==
X-Gm-Message-State: APuU4Z9M5aqyiu9J7fVMVQgsBEum7UHVMRyfUBTNDq9VQywiSq9tO8hZ
	h1dN/ezgudO8XeagyNvVeZbCGI31muanR9bH3d39slp0vIbQmr/OxMkP
X-Gm-Gg: AYBFou0sqhJ+DfG+nN4H+t7H6xWShPdc8Axw2IQcLoNVbTbMqE18My7fCZZGsbmYCsj
	34/bvm7OOq573XoBBB+bxtId2mGkvW6WM5yR4URHjeFFviAhwEnNyuUMjUOp5xb/4Vm792ibrz2
	hg7nJrf0BQ6GV8lVE1VNyFbCiqabZwT3Nchig/wjStlsegtmbxVGXKSlZK79p/qhl/1DC91SNsY
	3c5uhb46enMEE6Cr/EQexhrIAx1G+Xr1WNB9eD8SOM+D4TbZ7266Te9IZ0TGZKvoxi6ICDyqgHt
	ufJWp+rrGDEePK1QDfx6QNjxgDIwxK6gxXKn00gZFDSfgnT1CXC+TQsmPDUU6zltSRvaHgBYwIb
	H1koaX94ph+QM0bEWWuR7iYLrZcve5HQERpm9NYURjv6pTrIwTp5ParH+003W5l0lLwfNQDln3l
	voaIMQQ9AtQ0MqqQVEDZuVQ4hpkoUvzmveOijPLVZeE0TgmMtngbb981+JM5dibSCcy0Gf8BiGe
	EKgTyHnZslAPASZ8at+X+i1nNqxcQ6+aYqGE9S4DUwY+SAyuU2nxkJrXfX6a39HB46yqXYpN4iV
	6lIZnE/7vjZ5IpclJP4QZ7zmvxQb7yQDmZljNRAFOWypiLMcSL3/5j6+iLAtTrI4AwGR/GKMdnI
	z2rzPhlr8CCRD9fwNIcDK95aRdj33elCKyFkVpJ3O8+30foDfoVhJNcXFmIgj/uktG68/u+yI/u
	8=
X-Received: by 2002:a05:693c:88d2:20b0:36a:6d52:e16c with SMTP id 5a478bee46e88-36a6d52e261mr9285160eec.12.1793725580459;
        Tue, 03 Nov 2026 09:06:20 -0800 (PST)
Received: from LAPTOP-97G9G880.domain.name ([106.222.203.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm49661571eec.21.2026.11.03.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:06:19 -0800 (PST)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev,
	Mike Christie <michael.christie@oracle.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Eugenio Perez <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH RESEND] vhost-scsi: use FOLL_PIN for DMA page pinning
Date: Tue,  3 Nov 2026 17:06:13 +0000
Message-ID: <20261103170613.162803-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102073033-mutt-send-email-mst@kernel.org>
References: <20261020182640.2048506-1-karthiproffesional@gmail.com> <sashiko-outbox-180555@kernel.org> <20261102073033-mutt-send-email-mst@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 07:30:54AM -0500, Michael S. Tsirkin wrote:
> Karthikeyan were you going to address this review?

Yes. The leak Sashiko found predates this patch (the same loop leaked a
put_page() reference) and is fixed in your tree by Jia Jia's
058fc59326af ("vhost-scsi: fix page reference leak in misaligned I/O
fallback"). v2 is rebased on it and only switches that loop to
unpin_user_page():

  https://lore.kernel.org/20261103165917.148720-1-karthiproffesional@gmail.com

Thanks,
Karthikeyan
