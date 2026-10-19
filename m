Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C104D3BED
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421224; cv=none; b=NaEMYAQBMQxJSkrgmBPrgzkZp/F9t4N6DGHhId5VWM8KabzoP/zH840GyYTKRMyPftKhj4m3l3GwIwpoN57lXv34p8scSNu60jgEX76p8JGnFVIi2l01U4EOcPTGJZ0ZbRSzY67A2k4Bb1lYNNEdTpLEuBpHuCLxRz0EsW0YG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421224; c=relaxed/simple;
	bh=rHOolWs+HrDZTYIj1HgXgSZZtVsYtKQLKIFtAPPddUM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9P+JsJ9ZvdRFbrZcefiBTENpiA1fU+fYnz+L1bHQimZ1783qs89lQECQiaJOqGmWDg/lN1pNvFiDkUEEC7Ytx5dRKHdBP1WUDuYJ6Xoco5xifewGBkeU2IiTMS0FAfbzaNpz6G5LKw5lE7eRKsAMvCnN20CGG53n1PsPJ3jBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPep0AmG; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPep0AmG"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso424148c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421222; x=1793026022; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rHOolWs+HrDZTYIj1HgXgSZZtVsYtKQLKIFtAPPddUM=;
        b=fPep0AmG1GkpzGbJrhntLhDVjQlrvhyHQQfijmDtrKhG2mBVS4MXym/fIBRxdeqJlD
         YvHz+6y9SCk+ie+rOH4cEOfMB194VOJ9IrPDOEXiUjcJU1ObaLhG9ts1kiVWkQmweMM8
         RRadFbDcAMTzOueVbmdpar6PoebtOf+67h2uR3+vNd7H/s3ac/bypd7psi3Btj1XVA6v
         staOzi/QWg3EKiyure+Ln9MNq6MJ7MkRe6vkRNR9A9wagMcg8/tpINJwJwWjLQ0q17tz
         tQdegMwh+KoJg6IArVFmwMZQK0zqKn+bUogxLs1ATnswShU6tSO5bG+HPiP6XvAR/Z57
         1MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421222; x=1793026022;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHOolWs+HrDZTYIj1HgXgSZZtVsYtKQLKIFtAPPddUM=;
        b=gZl31xYbPRi4tPRTju2wNE5u7dcx1UIkdtGVQ3iWbXgU+noX/K3A1ioREkAqos3uzu
         w0o1u6InneHa3xn2qvwc7oPjvfhhjjPhLnnOWe1/lUkh8HmUR41lx9L2rUZy/zTLKLj6
         Z7SeSfc3jXt4EN5KiMcQOJH5KOPfBvtvOOv0C3gxrdqTAzl6U+OBxpN/DKygAkdSePnY
         epjvGhEzZ5JVrxfxVORFzMbfpPqosSCDOr9ArkGjj0zWiSs6W84rO8eF+zCY3NmvTok2
         +rlFz0C6q0zk/nZiYmZJxh4qn+4D2Qq+EsdlNjKAnw2I7AwKQqbwc8F8ZWe8CV360uZG
         f+5A==
X-Forwarded-Encrypted: i=1; AKwUvByoCF2tQNrwhO013ocASMZaA+rXRtFxew47kAhL0mETWbsORYE7/vUUEvgWF0gMzUBsphgeSU4HPi1n+3E/woo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJTFm47+yeHzh+1qK14MRMF3Xx4c7rlCaWMOsbI4Ez2jycPn78n
	DBGB5HZWxm5mqgv9w3a8gk73zMZj967KidjqIOJNxMCr/aS6mhNXYFEi
X-Gm-Gg: AYBFou1STMnvOxtw6TBq2eSsTGu36heWaBTAmYNpT0hNVsXNGV5cGtgX2cR3B0OpWc0
	YqfH236O4RuxJT6fYHcsvlzQ51p53NpVEWz/fVRpUsty8GflU2brYEZd7mySOMCgxevk6ySffQW
	xHKSs1z7zkKYRp05LBRQgNZUx12A3QQXK6803W1UFehfBEB2kvUtzVbE8/c/VniSvpX8xHmgYTs
	z2ycJ0hmM8WacW+gqg4ou7eZmsQqA35COsWaJ2qHYUjhNGnNHbcxn0uWvOetEVmpionKzh8g/zP
	H7PsbtlY4d0i+TgCMD7gXXXo+dIvYnSh90B7+up6bscncwbA0JeJtUAVZvEERIGnN9yiUKqkNpV
	xUKnm4xa37HiGcZy/45H0xqZG7QU9Ip+6MLCA9O8mL2d9d1c9BNUWqC+L3VX8WezxPvy4tJJlc1
	ChdBmHb6enN9zwBrqmB3w8upYqIssT5KEo3HlRNawb8i0CGRoe8J/9Ff7E30gNmzFvTWqbIq0k1
	WjeSLS4vP0bUfEm
X-Received: by 2002:a05:7022:5f04:b0:149:1feb:6dae with SMTP id a92af1059eb24-18513b9ac38mr9541041c88.39.1792421221518;
        Mon, 19 Oct 2026 07:47:01 -0700 (PDT)
Received: from [10.0.2.15] ([136.226.252.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm34263642c88.0.2026.10.19.07.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:47:00 -0700 (PDT)
Message-ID: <1af1ff8db7803c1b8f8e656eebe249cbe5e622b4.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
From: Martin George <martinus.gpy@gmail.com>
To: Laurence Oberman <loberman@redhat.com>, Guixin Liu
 <kanie@linux.alibaba.com>,  sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Date: Mon, 19 Oct 2026 20:16:57 +0530
In-Reply-To: <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
	 <20261019075607.808947-4-kanie@linux.alibaba.com>
	 <sashiko-outbox-176783@kernel.org>
	 <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
	 <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
	 <1a84584bc9cf64fab6b4e17bdf2050f9b176ad6a.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-10-19 at 08:43 -0400, Laurence Oberman wrote:
> On Mon, 2026-10-19 at 17:43 +0530, Martin George wrote:
> > On Mon, 2026-10-19 at 19:13 +0800, Guixin Liu wrote:
> > > >=20
> > > > Should "service-time" also be added to the accepted values for
> > > > /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
> > > >=20
> > > > =D9=87=D8=A7=DB=8C=DB=8C
> > > Sure, changed in v3.
> >=20
> > Not just /sys/class/nvme-subsystem/nvme-subsysX/iopolicy, but this
> > should be added to the accepted values in /sys/class/nvme-
> > subsystem/nvme-subsysX/iopolicies as well.
> >=20
> > -Martin
> Hello
>=20
> There should be no changes needed for my original iopolicies patch=C2=A0
>=20
> iopolicies_show() walks ARRAY_SIZE(nvme_iopolicy_names), so whoever
> adds a service-time policy adds its enum value and its string to
> nvme_iopolicy_names[] as part of that work. The new name then shows
> up
> in iopolicies automatically. The existing iopolicy store path already
> matches against the same array, so both attributes stay in sync
> without
> code changes
>=20

I meant adding to the iopolicies documentation here.

-Martin
