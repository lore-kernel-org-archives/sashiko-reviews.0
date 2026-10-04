Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6741836C
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103790; cv=none; b=QrhC9hvOr+hQHANemJnUdIVWAAMGpr0bLlB98lK+ENj8Qf8I4b/SPKFOmGmuLoYyEt2CYxPp6b+NBHrN3CQbzoMXsvdgO0DpNwNPs0R9nCHWc3i9R4vQhFrgWMzOPRXGxVoI6GFwYMqRR0OGJWgPpmNbbKvsGdWw1HJkeWh3rho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103790; c=relaxed/simple;
	bh=PGsH7rDWkRj8clYSuUGvdGlvrrgMjVS3OseQtK1KgI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDXFnmc3bnVcJlCAd8xD1ofuFgAOd9bqQaYUzvk2JmW49VKHbjOsCM/Y1l2HkAVgJKHtQHVVQI4v4qWlzWNQ3uQHmSgEfbWdgPjiujCM1sLFBOtfp8vNvmKU6yJJh/CI1wlQkIUrVFtHQNLMu2Pxlu3iAZrzAQrK3g5+C/+4fLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+MD+2VU; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+MD+2VU"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so688749f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103780; x=1791708580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGsH7rDWkRj8clYSuUGvdGlvrrgMjVS3OseQtK1KgI0=;
        b=Y+MD+2VUY14z+O6YboHyjJfNEtjdGLrORuQjPqnh7xdGRSGnMnzj7B7pwmVne/FMPs
         CotNVYPU9iSSzuJY7ZLCIA+JI8MuXU0vTzVQqqfSgP0CQpbXrThi5tP9gpDZdm2vIGik
         yMVgxTCSuh8AGFFhaF5RFJP2fReiFwbwkA96waeY6IR3Kl3zQ1f+WdYN498OR4BbSKMh
         IjHwSmaJmcWsn/YjYzjvVMK25GSrXsIH6fxmrnt2HDibLJ3q938xsRnsOFqSCcBY3daq
         P9AegrXvBnu+q9fQv365tpE/MBlYOCpk3aAWpBVI9fGJQbXssuxOnnfTZKUI+fK9UyCX
         wFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103780; x=1791708580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGsH7rDWkRj8clYSuUGvdGlvrrgMjVS3OseQtK1KgI0=;
        b=QDUelRsL62hFw2ylqpyIiwUAwibAv6TwnHPo7z9NP+jby6l58JYwkJOoLSNkdlA50Y
         DWl/PYqJTYz1V9bWV94ZVjO+1aHap/oGtx5JI1BWtQJABgB/GYi7bwCvwHZdkXjveWlU
         3yxpjuKgzWtXrGTPuLHzrn1YpEiLHTZStsCiMaeqMbfNx3hWbD39/d33MR1iGI/4obQF
         jTNT/6drHcD1inE7rB51f698glm6CKMlq8T3QwRo9EFm8WM6bAxVlWHR40FAnr6dI8Zc
         bDyD13T6YwtGJWyLajPDIlQnS3brRLkQSvIBRR9YnAZBdjNYPfJfVrd4B9YgReO3X4/P
         hGTQ==
X-Gm-Message-State: AFuF++mcPTgsFws36vudUs680VNzZWALXGPvpdflEwv9JFgDfUY1llXl
	ZTaE2RmrWogaSBOJ92UBb3+3XcguFVEqmABzdoUgrt5GfNduwlpU5vDXiFQ0kHP8
X-Gm-Gg: AYBFou3nB3icH38rtpKGTyCsXWUiaQUpPdLG4Ry2e0ZHEr1dhwOYvLjh2tkpeM8bojp
	MxNMTOrSFPomajSCv6/V/W6O/yYVHQS9Ng0NW5ZpWs6lCvX1hVAe55U8s71hICsqY/IguPoqxXH
	b6C/SisewuS0tgqTMfFBS+7cGcKYmxYxzlZTj2n8OKa4DDKP2Y9V3WfKuCCnqWf5k2x+l9zELNe
	wBOumr4V7LObOlmbvslS76KiuAp+7nu2+t1j+ySddJihPEJfsE0Jp8SQ/f74PJWDcV7FGoQXz8E
	9JMFh4eHKPuyLCJYr1kEGwrtCdMiJ4iTYUkz7DK1n0rl1JWQVyGnQg3+Zmxy/XC5S5fE0hRVtce
	KO9uQMO87Rc/quDVulbsmZwbTeeKrUuiQGP/V+Nd3wfCTbBQDipk+LfKYub42+eeKiA3ECebp5K
	m8peY550SM3YN5EZhQkVhO+31OLYqs+YCzd2msVh/yWQAy/fzzBWR1Ta7KZwsFD/54U17C8tHn+
	7En1VOMDWt3U5PqYwiblkbBLfwv8xX71XsMXYZBtIa+cbbBn9OFuW+6xizuLhvHGx4=
X-Received: by 2002:a05:600c:3b1d:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a170335d02mr17995165e9.21.1791103780373;
        Sun, 04 Oct 2026 01:49:40 -0700 (PDT)
Received: from localhost (p200300eba703ae00ca7f54fffe019321.dip0.t-ipconnect.de. [2003:eb:a703:ae00:ca7f:54ff:fe01:9321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm251131045e9.2.2026.10.04.01.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:49:39 -0700 (PDT)
From: =?UTF-8?q?Johannes=20W=C3=BCller?= <johanneswueller@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH v2 1/2] drm: add edid_overridden flag to drm_connector
Date: Sun,  4 Oct 2026 10:49:30 +0200
Message-ID: <20261004084933.1440705-1-johanneswueller@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175620.245AE1F0089B@smtp.kernel.org>
References: <20261003161525.23600-1-johanneswueller@gmail.com> <20261003161525.23600-2-johanneswueller@gmail.com> <20261003175620.245AE1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 03 Oct 2026 17:56:19 +0000, sashiko-bot@kernel.org wrote:
> Does this new flag also need to be set when falling back to an override EDID
> after a failed DDC probe?

Yes, drm_edid_override_connector_update() applies the override without
setting the flag. I will fix that in v3.
