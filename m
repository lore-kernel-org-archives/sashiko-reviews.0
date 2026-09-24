Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F14E323D
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286870; cv=none; b=le+xAXevwsSvKQB2U/Wzz8S3bo+wApSRVYzFU64/WglEhhMUwNHXyKLx2Y1WkTyWKzZbbqfbj6USyKwGar8gOUvJLEw3CPrMcNaQARrwNNQ80T8lpWM9BZqdxDSGBtZ4IO8QyL3o/0FdqKV4jTc5ztXnVG1+JZpqHLpSKxiAKvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286870; c=relaxed/simple;
	bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3Denr9nyrpTdfEaVCUNXd2gjxWTozh+guz34yl7gRbrNSFu58tqi2CufDXbtvOswFZZp5futedz6BUwI2TKBRbrlzaDxfRUl0f6wEd6cVxEzySAjo5PrCZfDXCnlIT6W26IVqy1XBqEQ9kk0DEt1H+2Qyn+NjMz6HM+AVdV9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rD7bPhhc; arc=none smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rD7bPhhc"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so133299f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 14:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286867; x=1790891667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
        b=rD7bPhhcYE7KdcId5F1RUjfz2UakcGcIEkZN/qnt2WHndlPyrQlKPLu8Cf30qDHX3d
         /ceiG93ipKExgoPf1OA76YC0dBzlN4FV+j0GGA7KsJ6m5R/Pumy1V/oU8SPpxX0oTqGv
         s5wcgnq4rCCt20zuP+vHGEWHvyiFFLFUVRxMWlQAQyf5nqbjZkhYlcdIdkTcx7i5R2kZ
         LYyoZ6bqrZCoGsnxFiQdcXJP1Mu8Mlzyt2+aIEcN7/3MmCujGxlUcDtWXR338gVjX5KL
         ZqjXCxW8EPU6Nua2AuOkv+Ctf4FVBq7m8SpsvV6JpDHhR3YB2KiuhEA//HraRWxlybvb
         fsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286867; x=1790891667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
        b=iG3WNzH+sjGO5V88c9EFZBU4kxqcq1IIXO4lsQqV/iRMIp0jRewzj2/bWVUbod5Y29
         j75Johwp6PokiftAsFXeT3O6IO1XSHha+MLtRhMMtDfxsJS58qP1iLreJO1jwTny29+r
         o14tbUEIXnOlpYjXWBOqLwvtG11ziothVIBgqGjiw3u3auCD34suIuVQh8DYLpIXIqhp
         VcajOVwc20eYHktagKVdbOBBOYYD6nkv9FQhs8p0AOgsAtkiY4HFoGEklXYYNEJRP1ao
         BbWnb/ZYIv9+pt4QsyG2IPx9Nddc8Spx8+8B9rXam1FZVFZg1rQCt+IuAf5a/Ed58YwZ
         kN6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6vNSdGKSw9FJfw6QOM3XwdYHQCXVmzFfHuzAyLod1oCOd5Dka/Pxqwb4CVU0ncX9ltMYRYkhd1zQD7FGsgmc=@lists.linux.dev
X-Gm-Message-State: AFuF++kSIKdkOrISpNgNdI+cVrV3AN6qAI/6975ns0FOeW4M9cYCkeCB
	MTtBYS2ptdguu2POa6pZNSR+EhH6b8yFKn/5VWHyDcwS4uXji9FuwRgz
X-Gm-Gg: AYBFou1fzC2dODrijsq7HJhhjQ4eumGxQ3Ae7nUG6M3NHHbISVYazg54UnwBcShsLib
	XCtUnb6d3ObF8k8u6Uj5+lUclyR3dObbn8Ptou4oQlMXuiN0gPrATKnIJeb+bNLxSqZlSMbxxoq
	DNUd7AWNIHXmA1BaB0DPLOa7A6XgKq9H02QutwejsHqllcryvAJiwIIj2gz6NawCc80oJTx+4mC
	YjDsvdNSGLDnVZ7RsrXJMofd421zvSD4Ec6TuVL2DwHxLvVJ6TRCP9ueSqARZYGL+gUQqtJJWgc
	V/SyVsYAIv/+Pclvi394Yr8+fTyDHnxQnvZuma32QeLnxXNuUHTYXfhGjhdg/BaoBoNaP2O81UN
	3LH41N5zMZ/y2xac3ef9zwYxTNIj5z4xCztJZhS+5O+A09+JOsAR+3RZbj1wcZxqvh4pOZ/LR/b
	jvip3launRFyqBW7g7vW1pKy9DKEunbrpk/ENomxAvZXgmRRe/1EDlggt0dlN/eht5A16bxVC/M
	yBPHB+YDjBFRR6XZwHl943Yr6QSFSoeOtvIOoGVsPuZahwtZyFpzoQHKgHqdr955vCcAmT3N1IW
	M9TDbUC9WUIrVKJ1N8Gn3J8jpyI=
X-Received: by 2002:a5d:64e9:0:b0:487:1575:ebef with SMTP id ffacd0b85a97d-4887176868bmr7025346f8f.47.1790286867087;
        Thu, 24 Sep 2026 14:54:27 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm2382024f8f.17.2026.09.24.14.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:54:26 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v7] Input: drv260x: Fix suspend and resume sequencing
Date: Thu, 24 Sep 2026 23:54:24 +0200
Message-ID: <20260924215424.931989-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831150323.2922792-1-mauriziocasciano7@gmail.com>
References: <20260831150323.2922792-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

This v7 patch has been pending since August 31. It incorporates the prior
resume-failure and teardown feedback, including deferred reinitialization
from open() and unregistering the input device before final work
cancellation. The patch remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
