Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD447F3B8
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884318; cv=none; b=hlFFhl4YEM6WtvHBvIoakkJkuP3yHnjlD+P7KcdrZzYu0Q3gOpFflowc0Z0RWGPLP7ZwVbXraLtbgTKiP0JTpjInLz/W7lxFkiPpGpnX9IqtQeXgSx4F6lNfECda+lpaswRU3sn3vRJtScJxHoDkgZNhge5kNcdDy5kP+qPqyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884318; c=relaxed/simple;
	bh=iXKHtTcO3OzXfeUrwOHsqSVNmwXV/F74AKan+YlAHVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aasi1GEAtMx07IC7o1GkWB9vhvJQ+M9iYsi2PmorM0aH6tgf33zL6T/yq0KELf0C0J5R4lW7b/V6tKX1+OPLKcUN4ccrE8+Dvucw4uU7La5O+EWAcW0WG0iouzjMUkcucw4Yyt/NYvLhKEO9GZpdQ/O/jpO1sSK/Iv7X5KJ7Oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnIoRITJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnIoRITJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso23305935e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884315; x=1792489115; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=EnIoRITJgzDIcys8h1gWETViZbytCK+c177PccmRhFhNiB4f4vwsyytSBK7m5/zpiP
         JCLzCyXkj1SZbTRiTo/aXurFdVr/XB/2x+fydVpOptxRiHhLoBuXXFHj3I02rr9p05YC
         Y7cCcLTd9UtI0hjQBHjYiFpqR72nVAXWFdcM0hsHjrSScaIfcyZkN5SIU1HlC50Fx465
         fE1OBGVqIZsgEovpxjuiZbqPpi3q5Z37EhPfEp/qpkiHOYcBLr0AChkiAuMFJHLlNWJ6
         4qAaOI23fpXApBhs2Z+FaPKHhunCRYy1B7dUuU6/5CTxk/57NPL1yOf7jOLLMH2V35Y2
         2loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884315; x=1792489115;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=j3LhmOrcm7YOPZNMSxyOCQxKWcKdmPCzRCDGUhbmRHPZZa1K0MBnIxEfi/NLsS+ius
         DbFJlPh4/hleAobOozwNmmMPOMIsu9kf+/t2o/e1R6AJAp0tUzhKm+BYNEAfdchNfaIe
         4cOBTOoxCaI5BL8f9Px8QgwZyKJQCdynJpEah8qZ0ACduwkCksQbC8yBU/36QF2fLYva
         aG2UNb7mrKouS1KAQE4XroBomSkKpfp86M5P6P205s4QqJhxg2jc7yXzJnMIutWaN41a
         fWXYoZVU2JP9hDx7jmIO1kJ7BLWfGZk3G3AVPXqL2uYJGcDUrnbMoE1MfhU1cPnvUMgU
         0O7A==
X-Gm-Message-State: AFq9FYKoE00/H+dx/W2c1am1OAFkSL8AeBYp8kM9eMzxPUudyo9IfH9e
	uRG6uB1sFPQV9Wkz3tuzH06UNGGuFdYuCl+WiVfqD2WOw2dYID6k3EtX+WXiposq
X-Gm-Gg: AYBFou1IhYq2uVekdPwY/8c9/XZmffYBsVgu+/0xXBGh7sSZUd/ZnpbaYp1NeYekfIt
	QqCgbcGQNl36rVSqgGo/DGGBeqrbbVlU1efxkZc5tZtnZs5Kfj4cIMw8Kj0rX0Nq/D6mR4PfnlD
	T/F1/3MItLgT3FAlsnLGZNpAYY6zvwaOdCNrjwMbozR8UYHNsHhiv0q+i0TTIirjpRLrBr4HcQw
	bYJnHG8Eml6HPwKNYVKyHB3iOKVN8INErul/NHfXharHITiE1PCI4WX+R1BzfOn4TTbRpJ2tlc0
	x7SMKzxePNgrywQSKCXPZJklSDkIGuSBTfLVZlD2UsyRaqyuuDmF8KvjhUBCafORxQ27Pu372sN
	fzD5AjITsCm5FpJFv8Pz2OvnqnKaaU+HBf78M/IGGxCpTI+Sb0yaXVn9ZO1YKcesz+mdLiir765
	9MntzzGJYtt74EoSdet49z7eU1SJhKk6ZvsXFChtY4+UShQOBgEWH0zQjg/3VAkxX+XZZJTks40
	F7OmtocyKDMpWWcX1u6NUNPWmqZyAF6XqsfgL4qqrfO9nGhkg==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr80614835e9.35.1791884314640;
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm450468805e9.11.2026.10.13.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject:
 Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Tue, 13 Oct 2026 10:38:33 +0100
Message-ID: <37Wk96VpSLOh-P0MeN457Q@gmail.com>
In-Reply-To: <sashiko-outbox-167402@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <sashiko-outbox-167402@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: High]
> Is there a potential race condition here when multiple devices probe
> concurrently?
> 
> If two threads execute lm3643_add_dmi_leds() simultaneously (for example,
> during concurrent sysfs bind or async probe of two LM3643 devices matching
> the same DMI table), they both might pass the lockless
> software_node_fwnode(nodes[0]) check before either registers the nodes.

This condition is currently unreachable. It would require two LM3643
instances on the same DMI entry.

I'd be happy to add a static mutex if preferred, or alongside any future
DMI entry for a board with more than one LM3643.

-- 
Rillian Grant


