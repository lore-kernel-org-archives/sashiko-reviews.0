Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2D30DECD
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388521; cv=none; b=GyTs4WQ+ZSNcYaQmmW2tlXPw3Z6uLZZ/pBtS2cUpdbYULQEGgdu2rlDgfQZXURCivmsyi2nuNQohpR50czUrRKb4Lz84KfC8InTTi/5VbIJwQkL1mDUzXXPJqFoY2XCkYl6XyuCP8Vo7NqnZKNV8/92eDlzzBxojQ2K6nPxcLbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388521; c=relaxed/simple;
	bh=FxSEXtq2OoVITHSnzD5ij/K70XiUpTHdNjgIOzqv/PQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=r5xdAvkhoBtK7sEfeoBeVUu9+i+QF+vTQu76Ew9I6h+JDRhejFyPoi2tXZg6ZZpgxrZEgYaMHq9Ps4tOvdz+HIffrt+8xVazdJQ4nLRp9pPG+/8hjnyizqJgy4pTlH2QBSt+BUXxlXtUQ/9sYUiykXM1V7iI4IlJ8JjgyD6VK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzBc2cVv; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzBc2cVv"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-809b19a7f25so49147617b3.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 18:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388519; x=1783993319; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxSEXtq2OoVITHSnzD5ij/K70XiUpTHdNjgIOzqv/PQ=;
        b=UzBc2cVvChMX6nhY3CKRnp0/LH5iISjNyI84RhYm/nhGtsxlDYoO7PlkNq1O9CqUsk
         5FJjgflnPT1m29BQaA8JZOHqmbwlddW9QK9dbHZycQ/8DA1JmfWwnUXCpk+AhpvmDwFR
         NoZ4zCaOIhsJPkE+TBzNpyU7ME5yrKjnteK/7GZ0oHTeG3Z3cmozBs7cs9pNQ7OdYece
         tBNNMcQYzDIz4SgZANCa3PKIOWVbN1cwYxX5MYpe+8ZWTwFLJ0BxAiyN3dLKYW/v/uHG
         IAr+eZJRUH6tb6UA0QcxUriwFNzO37+PbrKA66j1FfWvweQvbweaHOltVoRnxCB025xZ
         cTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388519; x=1783993319;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxSEXtq2OoVITHSnzD5ij/K70XiUpTHdNjgIOzqv/PQ=;
        b=S0elUcGULSd+M1dW79iJXtA1wr9kribYZHVz3OCkbTUXXIT/tLhXfbzpcoZgjjb1XK
         7mo3za0CKFI9F5cC9zKpwQIENOSlGnGGg/V+8mx0VgB5yX3ygjov0iXB+Htgw2xriHRT
         HZgRseGo8IpJBjLJ9FtEhB1q7j5vo9eNlg4YzQDdGL+rFGytSWHREnLrTUjTuDoNoTx9
         VnViUwl5n2RT5Rfn5SWS+t9S0uH0yLcuS58A4t6edsfZQzc/9p95/TICBOtHZNRloDoC
         GRtAtasF6UkTVVO5K6PBphBbYjPZGycFidQeZbpbYx7B3tLroF9rJMgbNM/au4wDp8K4
         fnew==
X-Gm-Message-State: AOJu0Yy4p+9/KObVGCrVlSQN3heLI76jOyQCYPxXPKMr6PL6Yik04Nbg
	WABk+iIyQqAzyiADZEiIRaxhFwB0kXDnY0EXIhGYZxjc0SaLtV9r91nDrmw0/1vD
X-Gm-Gg: AfdE7cktuhiaJXyso84HAVEb6lxdvFGMQcatREnwemEMHc6we6SYrxinZ+K2pGVTfs1
	o8OikzGi+lbVe2c9Sj7HpT+c9A95rr/NWgvaomZZhGJh0YOKexGpnAh0zcqfdiuAH7xNi0OKk8U
	ZPioFf4yIGodmDhmRMS0fIilcompfuvqYI4eD8aT8/WsjK8+d/0h9r9LqJ2b2otgScZTYZlCZmE
	Mni12iXTGc9TBKUCEXY1UEY0PsXXt2ZdHCzWwAtCZblbn5aHmNQWjnSZVnu4gnJWIENJAK1TTr8
	C9CyMYvaPXVkJFU8zMX6wxYQ4nMQz5g9o2jYyOKLqcVzayd926+BIqMPOTWShdzjuWTUeuqnDwq
	jz3wn+upomcLtVhkaCvF8a+qhc9lqKVlxqXvld5rdpIIFAYKMBKgPPQpuLKDm0HUQQ40DLnYyrT
	wkl9wGXaUbnQfOoBbtzRJS+IHSv1MrRHxEIPs/3OBbFzDXZldQHeYwmHgHkt3jexl8HNVMbrb0y
	u+irpZodfW8mVq7+PJLQ1tcp+jmL6yJheRRwnvb
X-Received: by 2002:a05:690c:6011:b0:814:3d9f:c0a4 with SMTP id 00721157ae682-81be2d83024mr25576387b3.55.1783388519217;
        Mon, 06 Jul 2026 18:41:59 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af512e7sm64629477b3.24.2026.07.06.18.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 18:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 20:41:38 -0500
Message-Id: <DJRYGM1TBAY8.39KCXCXTQC5Z7@gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <neil.armstrong@linaro.org>, <linux-amlogic@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
 <20260707013437.27DA61F000E9@smtp.kernel.org>
In-Reply-To: <20260707013437.27DA61F000E9@smtp.kernel.org>

On Mon Jul 6, 2026 at 8:34 PM CDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch modifies the error path to purportedly free the `aiu=
-formatter` resource by jumping to the `err` label, referencing commit 83b8=
3024cdbfd. However, the `aiu-formatter` allocation and cleanup code (specif=
ically `gx_formatter_create` and `gx_formatter_free`) does not exist in the=
 codebase at this revision. The patch is a "ghost fix" attempting to resolv=
e a resource leak for a feature that is missing in this tree.
> --

This bug exists in linux-next. The AI is using the mainline.

--
Thanks,
ET
https://github.com/sponsors/ethantidmore
