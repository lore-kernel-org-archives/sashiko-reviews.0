Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C971F3BF692
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727632; cv=none; b=WmofVjWQsTDR8J3fiqGxV74xJJ1CGV95nOKRbOs1FJkVKxdWvzBFcqOu9tolAXqiGtbT9/6lNrKVEys0AOfmCokioX0CfwIJIGH5TJn7A5VDoImTfyNwf9xJ3yMg0PL0yExjEIuKCin65UC6p/35e1A2djs7y+AftKkMBo85B0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727632; c=relaxed/simple;
	bh=iCK9cClrvayo1HAZYrDC48KsSNt/dqvABNvPzrr23O8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbIdq42exsFWpxtRvc/3GuRTM6eQSjt/ACdh9JAIHPIHs1VEvFFvmnYB4F5i1DHQNsHgRbzwadVbNZ/Wj3L9qyfnkHPrYDuz8y0ykdR0CwFlpQ6VTMyI6X0Gd9sAbylwe5160HBdye2txLPM4FDqEVYYVMcCduEG0dfQSOmotvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpKryXN4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpKryXN4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-891d19d00ceso280751b3a.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727631; x=1792332431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCK9cClrvayo1HAZYrDC48KsSNt/dqvABNvPzrr23O8=;
        b=YpKryXN4IT+HbYJYaDQDwour/+h9nJ3fMpZJEFnVoRbgroOsscaim8DIYMknQm/RTU
         pNkLOMSQ2djCDoeWQSLuUMLc1qbQOinIxJSbCtF6y1WM5qiwu0PCBjtnBgswmmCjWvRe
         hYAZR9zHFyVLc++ExDrNUeCGTjbH/p/g8kArbLhMhIVDYULyk2Oxv1CYZb/IbR4BIaJx
         Dc/rFHA+AknZKXDMO/Z0A+vSRx2jXRu2MocQnHm1qUtl5x21CXkirrEiylrI2IYZpgkj
         yRTorN6TRM5PHP1ohaeEqIXO9ydLl0h+VoyICoaEQmPNUdojqpDzcIgyIVeHBDG5lHnt
         LW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727631; x=1792332431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iCK9cClrvayo1HAZYrDC48KsSNt/dqvABNvPzrr23O8=;
        b=mVe5fxVBhnDB1I21j78qcQ4mE5mbYSe9m2uH8CfQLg19w+ddPWeaVBA6G4MJHNUQhK
         yTJx/brWYMv2jZpQ1UjsVuE6+vRPx3eOjIGkyp755Ciw2SMsTClhVYJDOL/q4tJmTy7M
         2rrhQgyWGLQBlx0jXKhbtI05oe/fkP/sK6U4IVymP/PjWuSqqsr4gNCJ/WWGwZfj1oZ4
         p2RWqntlW1prWfIZRKHuNhxM4czvYHBUW1pUQj8bmCxD62Zvo6GoIYKWp/32/N35zy1U
         ysywvNVJpEdmVo2AWJMmLx6YWrFpVhzjWSQNI+kDvjnPQGJBMUc3w6C7d+GOmGeu1O6f
         YVMA==
X-Gm-Message-State: AFq9FYLaxlsW23btjijdyaYn/9hZLhDq36xcWHyDZ3AFTDNtQgt46ccp
	10wrDh+7Se1b0BuiA1wGHOF0z/kzqMKU5aT/1p6PAHdTTi5fxnpyjvOLTqrsm1wg
X-Gm-Gg: AYBFou1Tg1IhQa2/MqnMWaoaEEjEhev3wsKzrtIu+oQZgmSbLBFfhCDTnu6h+gKgPOm
	0uLr6kNRSew5QK35k5T9Durb2cR1EwAiR1vgKZAJ6Y9IcLPvbD5J/NNAO4kkOeSvPZoLxWs3Scq
	L7RBc74g9UslEsxxlqxaiPDI04KURrn/5zvgAoVSKhzncMu7HpJuU8JZbb6IfldXuEgDddPMQ3P
	kz/5La8qubEJXRBdc9fvhZVE+Pec6o3zTrCPYlWXAJfik7JlIliHojA9b+vfPtmM3nZef3iWJic
	Ry2lQ+eD3TSj87epgN9E1R81bubPRaNobWlwYmV060+JawGDmIi53qHmB+SXqEHX/dqeyFdqH3n
	ZSEnjv0t09TPLenWA6YvxZkzAQU/bh/kGLG7q3+Vkq9ZrilaEg4i//Z/ShSH6chI4h6tTlX1N4a
	UnT0fIi284plX5+3UGf4/t4wvBhv+VdtbMwJDeOwP9LOQ8JDN7gI9LRD0ZvWRjoDF5NrhhS/o8w
	9iCMQol7ibZ7w==
X-Received: by 2002:a05:6a00:420b:b0:891:8c46:7bb1 with SMTP id d2e1a72fcca58-897c78da72fmr6086369b3a.56.1791727630902;
        Sun, 11 Oct 2026 07:07:10 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef2easm3165938b3a.7.2026.10.11.07.07.08
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 07:07:09 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Sun, 11 Oct 2026 23:07:10 +0900
Message-ID: <20261011140710.722-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-163186@kernel.org>
References: <20261007155848.106-1-26rote@gmail.com> <sashiko-outbox-163186@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 07 Oct 2026 16:12:16 +0000, sashiko-bot@kernel.org wrote:
> When a physical unplug occurs, msm_dp_bridge_detect() fails to read DPCD
> caps and sets priv->plugged = false.
[...]
> Because the plugged flag was already cleared in
> detect(), the unplug handler immediately early-returns:

Both of these are in the tree without this patch: detect() clears
plugged on a failed DPCD read, and the unplug handler returns early
when plugged is clear. The patch does not change either; it only drops
the reference that detect() used to leak in that case.

The controller can now runtime-suspend in that case, but not under an
active display or audio stream: the enable path holds its own
reference until atomic_post_disable(), which first notifies audio and
clears audio_enabled and power_on, the flags the audio callbacks check.

Whether detect() should leave the unplug teardown to the unplug handler
is a separate question, and I would rather not change it in this fix.

Thanks,
Joonhoe Kim
