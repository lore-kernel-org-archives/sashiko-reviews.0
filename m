Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9067493642
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590110; cv=none; b=GgZQbHzXFinN8DbJU/Ran2phEw0kyLlkQ5TgMA+ejAGLALl+oDgO5+qbHZH1vr/5aWp4HbYPw0P2DGJJBtKgRgVyF0HQzAtr5pLq2U2Lr6v2K5gs1cDDMBiQBnci7WdAcQdc803cSl0LA900e/T0AWo1ChN79Hm7GLQEcyzyNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590110; c=relaxed/simple;
	bh=XhAixuhqSe/dsQG0NsclCcJxEyaEsGjyMcp/KpLvQIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgtcnFGphN8+X4zKBQ7mg/6Aa/3woQJJ6XyT9W7sKJvySzTsBWp0WCJmoMS6+7ekDWe+9WRZrgpxJBeou6KPAA37SPlUveUvn7xudn/32M139gzHiBRxh7nX7VIpRC1ti8WtAGnOdFEfUE2zaFUWF9YODOALAA2NHJ7SDxNocgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGvSo0S3; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGvSo0S3"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so346764166b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790590107; x=1791194907; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=ZGvSo0S3hqU4FSarH9JBbmbSLfDo419a8IxuVmDptiHB/aiKn1yRpT9Fkwy8IjxiVB
         9w7qgOK7NbX2gRxXhgPyyf2u5nEOdIU6jCHoIHXZcXSafF7Nj8EuhmJ0DvEdmAFvjWmH
         wsVdpR5yPtk2m/Y0lTZKlmuS/KMtdnc2GxuHry3NYz8hHZD2F511W9nO9eW8B9gUbrLf
         u98dUSd6zha2qG0dCiwlooJXpcTKP9sdwaVvm8ziP+ZnuUryd0YBlbl20jDirlgSv0fl
         sLX3kewdMhdYRxcBgh6VmsY7ydanbQLc5qfaevQ+2r9VngoZGDBosp2y9/vmWq2G2AkQ
         rIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590107; x=1791194907;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=H8qNdDhKAmUbj1dc9wSfG32rml9m6mK6KiQ0uwR81CvuRyKq1Aeiz4R3vUHdATHCAJ
         NvsTyzVLgx2lXfZqiKunEofIE7W9KxVd/CkriqPgJD90M8cJXiyaYRL4MG3HHRkDUReF
         5h8BEoo1oHBI+8UPfh8nVGwaGM1uHjICRVCPHUN2IVZOzaLRyTvPdSCBTXDW7joZWSyM
         5j2wY5LA7JHY8jONnKWvK5CB/Zt7cOde57sfoRJHxMYKfLKERYrkAvvhpnwSZzguNbUJ
         Z2UvnHsKfmTR1Rlf58alkIH52d0UGqV6OjWbxWAE1oJqG9Q4L6/nrTpLzil+fF+khCvh
         oLrg==
X-Gm-Message-State: AFuF++l7MSqB2yV/kKJVdzLp9K7f9YcwfNJa4JU93HzS/HgvXH3g9AZX
	04PI+Mv1D7w3X9lNhAAtoiqAhbsq6G7laD4lmk9EoCqJg5I0OghyiQsoyyDJrlvZ
X-Gm-Gg: AYBFou0sstd/U7/ZfoNs2IKVDC0nen3vzE9HxAqKREujXC4UUOKoLXTltC55U7ohiiN
	OAuSs8FYjpeFZtMCUzzxSg85x+ItfejqKSzK76YE4wsAVxA2ovSD9Fx0T3XaQelK1EF10QTL8ZA
	QoA7xvAhtzl9++kov9Pj7dIZIlFY0zLiCvbsx14OXBMblJePHzQpz47TkpMvWHLCcMfCu3QwZpW
	cf4INSExcBeWpQrymxz/NE8Arx1c4THWNQX7r/OIJ/BcOGe6dv3Uf/kUXf9S3ymzgKWhY4/SHMZ
	UfdRVa+uMTdDKI+M2a7sJOtNBb4FFzQMID1xMsqhgHdtf5kvB39pK3xxaFcZ/ZikNbQ7T86KB/b
	P4jk0HbCk38GwDbN77qnb+Zp60CUHFJXJP4ZV/iRfa6YHkgwH3No5gYg1sSxTrlmMBVNljI/rrP
	SCcWMOs0FYa/hJYTuEFtebd/LJVD77u2tk8NY1J0RkQJ4CTc3+9rWYb7XgGykqGEJH7s8WmZvbQ
	utnNzJ7m90yJ3Q0LEv8B6bKLkkJkmeOA3AKIdVlimKLPpI8Qw==
X-Received: by 2002:a17:907:960f:b0:c2a:c76c:c743 with SMTP id a640c23a62f3a-c2ae9f6a1f1mr749798366b.35.1790590106798;
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2bf3c6ba9dsm304459866b.13.2026.09.28.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org, Rillian Grant <rillian.grant@gmail.com>
Subject:
 Re: [PATCH v2 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Mon, 28 Sep 2026 11:08:25 +0100
Message-ID: <Spi1SCcTSB2Ab7fZGVbFXQ@gmail.com>
In-Reply-To: <20260928095015.096591F000FF@smtp.kernel.org>
References:
 <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-4-rillian.grant@gmail.com>
 <20260928095015.096591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 28 September 2026 10:50:14 BST sashiko-bot@kernel.org wrote:
> The subsystem rules strictly mandate: "Only log errors or warnings." Since
> this call to dev_info() executes automatically in lm3643_add_dmi_leds()
> during hardware enumeration on matching laptops, it will add unnecessary
> minor log noise during boot.
> 
> > +
> > +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> > +}

Agreed. I will replace with a dev_dbg() call in the next revision.


