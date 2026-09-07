Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D4483BF8
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786435; cv=none; b=GEbaVaE6mXRfCoQXQ6rbvh+Ue8TJE1okFCHu00Sy7TpPPsyIVcAqrZKPhJCwqMzCY6bq7x6aV7hvSPiutCUPw39q7Ny/rQDbc355DrDT441ScAGDs1Faf3wxRH+izCEnARj/ghuQdf3BclswlOHe+su6qndexwHRh7lEHCoR268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786435; c=relaxed/simple;
	bh=Qv7I/lvvms82Javmu3Qn4HLZRiBz/qbZQStkMGxkn8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQa3kz6VxruaFHyjyhrkbwIpBxgNol3/enbawPikwCXcl9B3bA3IagZN3Egeg2PnmrQUoz+rqWBAODPJKxZQ69jVaZXkRsy8t76W026PJrpEUMbIKMn+XroLd1VMwxqBlFo8rN5U7dXmi1HG2QM8p2DNxWqjlnU2eBXdYDdpfIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1Ke4Tlb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1Ke4Tlb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71ae3455aso52480495ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786423; x=1789391223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VpUJtRIrgP7Z0MplUt6dRio1tuWvg+b+028E1QMqao=;
        b=g1Ke4TlboR0p8oPrus3p0phFcQXZs2v0BhdL+m2Ok50XJ9zHJQJ47QfnEaJDZ4tZEp
         XG1MG7LyHVSPO46oxu1drmoDvBuTgQ4bMH13Dk87QLOXEeXE1G3nAavlu22l1bcnaSJ3
         s6onAkG/FJEE53he8LhSK09IIGpXpls/mmGI5FPE7BdpgLNzmXANGWMQ2poG/g07Z5OW
         n55cytSyavU6xUDGYCOLqZXoKL8mPCxyAVcoqgfTydorlduhMvuMvUpm6Q+46sG5fWgN
         Wg5iTYxjn/DM0AqeSYcqjXytVTyBkVatueFChzGOIHjisOcVoYZ09gXQINGdxGv0w+0E
         SD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786423; x=1789391223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VpUJtRIrgP7Z0MplUt6dRio1tuWvg+b+028E1QMqao=;
        b=OAH28ZQ4wziPoRVWVRFY8s1M9nUoNWfJ3Em3b7VcJlkAcwa6A3xt6Pgs9KSYztApm+
         vvO7MmdP2bhj9ReX3lMK94ZaC6nXuHrACNTPK+sYck4HEaVZRaJCLNB6EQoYMS2x4oD1
         uWpAjIBqs2srGCXYhe1GfBWoYY01t3Lg5IEW2mIg8KhH+cJSpmv8qAY8VY0b2VN+vmvp
         n724oUh7uMAEMarCjhdk4UN2xBzSU4lIT40H1jAUgxysfTPIRd4ndM9UOV8C+ozd9osV
         W6CMzzGEuuMrl4d6Z1HWA79T8TsB2LRD/pZ3VU5L5llY6qYKvALWhSKvTPPOTF70RMJa
         cIAg==
X-Gm-Message-State: AFuF++nI9F93+2yRxs4l5AbsgqKxT4GvAxjAPe0ooogmSt/a6ysKoVyt
	f1JoxIrivH30H0hQuzTX0ERHQo45VRqM7fDvxuIsUcTkf4gaelHZ4PmdQgD++SM=
X-Gm-Gg: AYBFou1962dMJhlQq0mQNEKM5BbiwFrUTNQ0VdXiAEE8fVnasPwYp4/5RPrL5MuBVqa
	f4x7upEPHCAP05IvirPfBB6KIyEdh1HKcPLU2nGVF0Q7Sszvzc0Lg+mPBbpjLMq3t3KwmisNfzZ
	qGmJTqmXsftiZc5kZqnQ5/7B1islRaikUjT5qEWl+jXmTprQQmSlbyn68Ge8qb1Kuuc+WJ/+3fz
	Uub7S+cPDox2BhD+LU0r5GhJJomB74NNKTGGieLUxuKi2vHL3Hx9Kyvh+BQWQawLUSkmPnAwjqt
	QffdkyJCOmFB4h0Zash8OHaw70XYR2WM3mwISxpO9cmAtkIBwzpwEzIjE374WraBYV+5Cib/Nlg
	WV1QqwHZd12mcVfBmt/RI5ZAhPUXvGK+UYIuGjgvOEARqcme5VRh1B1U8ZcZdfKDwgQ4JPO92Rv
	5ahOnPjWVARCalXfBEw/f5QtJSmrx+yTDTAShnHaG3HDsEmpBS9gEVxh/jRX8JgZCulfb7hYHDC
	XNGn6w5hyblTufu
X-Received: by 2002:a17:902:c40e:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2db125ce071mr306527215ad.3.1788786422799;
        Mon, 07 Sep 2026 06:07:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm45614325ad.63.2026.09.07.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:07:02 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf v2 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Mon,  7 Sep 2026 22:06:58 +0900
Message-ID: <20260907130658.612004-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907054700.738DF1F00A3A@smtp.kernel.org>
References: <20260907054235.473103-3-donggeunyoo.kernel@gmail.com> <20260907054700.738DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 05:46:59AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Could we update this comment block in exception_cb_stack() to follow the
> preferred BPF multi-line comment style?
>
> The BPF subsystem guidelines require the opening '/*' to be on its own line
> for multi-line comments:

Correct, fixed in v3.

  https://lore.kernel.org/bpf/20260907130624.611942-3-donggeunyoo.kernel@gmail.com/
