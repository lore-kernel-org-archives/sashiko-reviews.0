Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94F3ED101
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471170; cv=none; b=e5lu/S8zJHl7db1ZQyZopIh17U765Xh9TfldQJ5hDHQ3CncvFfQoM/Yck1ytSeJ70/AkpQ8e+Rxtcnn5pcOhrvrqBD+2dhufgcTg7nyzuwUlmDTxhdnxsuINylt4aKeCxkTzUWn2LEuX3jtPO8liBbblKjgvO2DY3WQl2uCTKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471170; c=relaxed/simple;
	bh=fS91BX94afUHBq0hR34eheoAQu1ZkCenArwqnm/q0JY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n00rVKi2QrhmV1fHqDEDBTS0G3/HI3dODwRr9gVcHoOD7L+5C40TKJbMPA6rpcS3I1PotV27Ale8DABNgi/mSKiJZgvgdDOCEnSF+NiiObDy7mMiTTsdnjtk0wBXt7n2NVZABeaPR4Hd6mf+xS8YBFxCW8nsnlOaALbbnmOYHaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nv63onbT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nv63onbT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3637b90so5206095e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782471168; x=1783075968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No42VPQLeiDXP/prwUIiSxKS26SONyeJJDp1wy05z7k=;
        b=nv63onbTN1PpjoL7bqkefM9aI7om3J1f83SX+kN2oNng3ZzQ/Zd12vrZDLmOxkLrhX
         QnOrZKT1sXfBIdk9PWfpLzn8CMBwplxNjRz4MkvjfMOqzjdLOqskWHrzDUzo4UDQCizb
         Q9eimUh7+L4yJ4qvzcoIA/rpJDiY2cFD4uTFvnn+rJSj+KaafUByKwoEyDtG97FY+r0j
         2Uet6wCjvfRXdfZCDrZL8h4lIufzY3ykcV15JUWCZa/ac/oc+fUC2caeGyFfVNyBGLPf
         5VaXiEMsQ5SUQr7X1OulfGlJYfNrJZNhdHdz0dcbx06C31GXMMY+B38qBiWpPU0lJ4ar
         eyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471168; x=1783075968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=No42VPQLeiDXP/prwUIiSxKS26SONyeJJDp1wy05z7k=;
        b=rE3OcNgDIQDZ75jFtzlxZqDBdjAFViWoL0b4+K5eTMThKAruSgx5FO+IpjlrxqFkTO
         VkA2EXb7qkUwjv5glNN9nsiU+4houcI1GSWRpWeTqS/dWuCLSo+3rlNkbD/Jzle1b9UP
         jd0VSX1MypazIDal1/eav9DAuXFN6cdYDoELXIlFVZ306OSdyMroZmVVn2gn5A0cAjAF
         rGiquyJ8ASZSOFQSQlYNccUWqwbIBBAl/OljeSfJzyJktLvp9kw47lIX/GSoHxlrV0mE
         p+DlQEpSHP++wRbRqd2VhwiAomfyQD/xnc+jWzJpIJH6iA2y6RQXzNq1ocosjykgM12y
         IEgw==
X-Gm-Message-State: AOJu0YzqYQ1nbBoML+1CdGNcIcSk2akkecbyw6R8NPUDJIKm6GJaNg/p
	2oWJ1QAz+xwL/n3/oLP3jEssUTUA72fhBB9YPoJ96YbYQpL4KrkOGWvF
X-Gm-Gg: AfdE7clSikx9l5LU1B2R/K/DgvMsg2Sn/+guPn1WUaUOQr7hNf5Zx73WG8lj9dqV3WX
	XB3D9OhyFq1McMvNsxsaxg6ew+nMDl0xtWcxxrkQReDJRWrADKyS8Bevvez3ofCwxXJmO7tnS0A
	zaOv/Fht+4wRDMILBO3tOm8uds3ahAHLrXXEintZz6cdCra56O+1naA4ZBcdDY1zxOMaZgoYnsy
	sInrgvW2o4iOdJBKvCLJ2+QvJ+t00ZFuv1hn/TK/+ELOP3oJ1YI7r6V4ZGrOsZHtX/DwAaemKjZ
	21527jfJxhw1F1PKT4lN6m7NnlDUXkjQCQhGeC63ZmHE4+J89O2LxK6jiRdcEEhSqpFvEFQN7hl
	CZqdNxgycxMCR7NuFYBfD4Pm0KQnCoqoJDzyGIx3Dlvyt9LZvgODAYD2ZjZEK9x2oopS84pSpz0
	YKI6S0BYW+PKUr83bTjDKnEycenSID0pQbkbvtBmZ6LLML2Quj4Q==
X-Received: by 2002:a05:600c:1d0d:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4926689f6d5mr98905305e9.37.1782471167704;
        Fri, 26 Jun 2026 03:52:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm2089932f8f.5.2026.06.26.03.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:52:47 -0700 (PDT)
Date: Fri, 26 Jun 2026 11:52:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, yukuai@fygo.io,
 linux-raid@vger.kernel.org
Subject: Re: [PATCH v2 next] drivers/md/md: Use bounded strings ops when
 setting disk->disk_name
Message-ID: <20260626115246.3477f614@pumpkin>
In-Reply-To: <20260626085141.3AEBC1F000E9@smtp.kernel.org>
References: <20260626084334.3012-1-david.laight.linux@gmail.com>
	<20260626085141.3AEBC1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2026 08:51:40 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Inconsistent coding style for the sizeof operator in newly added code.
> --
> 
> commit 663613700e83a5bb9c1749d80b4fae68752645fb
> Author: David Laight <david.laight.linux@gmail.com>
> 
> drivers/md/md: Use bounded strings ops when setting disk->disk_name
> 
> This commit replaces unbounded strcpy() and sprintf() with bounded strscpy()
> and snprintf() operations when setting the disk_name in md_alloc() to improve
> safety.
> 
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index d1465bcd86c81..afbdc52a11270 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@ -6354,11 +6354,11 @@ struct mddev *md_alloc(dev_t dev, char *name)  
> [ ... ]
> >  	if (name)
> > -		strcpy(disk->disk_name, name);
> > +		strscpy(disk->disk_name, name);
> >  	else if (partitioned)
> > -		sprintf(disk->disk_name, "md_d%d", unit);
> > +		snprintf(disk->disk_name, sizeof(disk->disk_name), "md_d%d", unit);
> >  	else
> > -		sprintf(disk->disk_name, "md%d", unit);
> > +		snprintf(disk->disk_name, sizeof (disk->disk_name), "md%d", unit);  
> 
> [Severity: Low]
> This isn't a bug, but there is an inconsistent coding style for the sizeof
> operator here in md_alloc(). The adjacent branch uses sizeof(disk->disk_name)
> without a space, while this newly added branch includes a space. The kernel
> coding style prefers no space after sizeof.
> 

B****r I only fixed one of them :-(

	David


