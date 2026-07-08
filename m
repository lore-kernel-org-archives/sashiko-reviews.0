Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8ED3CAE73
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538954; cv=pass; b=cJovhSPucG2gEc5iF/FdiqoAaQyjbIkCv+zbhF5E3Ag4NRu2/acgBff6umKULY/n+cFQRYPOgsnWyf7446Vp/p/KNCkxSU14ZcZXAH6m1HO9P4EYW5aPlHtLGgh6aUV4uPML/UyibiKdY2ps8z07aDmSBD74sx1aFykyRmT0v/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538954; c=relaxed/simple;
	bh=esUPZMaeDhSEKuB3vyh8QdBpdwB8JbRv1S8jpJLODZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8tHLPuh3EBRmYs3QH8sHsIL1HLBW+UrETtZDS5mm3n7kNI40IrR5Xh1r5S9StdrzpbXoidq4X3zNiOzpco+2N05mhLr+fX+8uYeBS1lgrgiC75KUJrFIMFnyLKbKurFOyyoQUG3gR8i7NU/hznLLXnsFqYC2OiHlkb6ZR5z9QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itG8PKOA; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itG8PKOA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66628618509so185508d50.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 12:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783538952; cv=none;
        d=google.com; s=arc-20260327;
        b=JSkJCYOu2D7w2IWBeACTmfQ84W6jurgYOiDbXtF9HOcpLCH5GTKWUd7TPQ6OS56AW8
         A/6SZiY2DuYbLSf1G0YpEwT8p4is4bsTt2jiCmLMQJF/4Xs304ZRuT782PmRkuOXzuFO
         SH6T66IGitNxgs+jRcpjEjyQOqD1bDp8ZbETzkfmA/MrSFSqlYOONv+5HaTbjDQRFQzW
         VehFFHcevtQMugdx/b/HavEpCW6ovJ3Ote7cN2LqvrCNhl7s5hhDrIedhC2WOQoAYcW1
         eMGAztQrn+C+YDgY8WdtkJoKXbjwZ3ZVjATLyyBz99stuR0beS0N5DGi1L3GZI9FPTr/
         iLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=esUPZMaeDhSEKuB3vyh8QdBpdwB8JbRv1S8jpJLODZU=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=Ihzy4QP2zFj5brSb+Gt9lomDljGe9zBU63OFyKRj98UskVe5GC8erIBembZg7mklA2
         8/bIjDdKqPVYgATBK7IouB0tP5h0pD3qAkqn+5Ylnrfte9MXfMBwU58bRRCeLTga16Sc
         q57yZhbDcV8gSGg2ML7KpqC1KRUQg8MWc0MjGve4NOQ34Xl2k1XfSjgn42hv9RSpMWZw
         YOyfnALQq9EZF0vFoyzRsLMHBRNI4n8xer0Wyp7O84SpK2q0f1OX2iCEit5uJn2tos8S
         HM67IaNKkiFtRy7RiSi3YBxoPxqYpXqfXvM4rEW2RROqkDJ1hMpUawBFAosMzpRYGLUI
         zGgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783538952; x=1784143752; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esUPZMaeDhSEKuB3vyh8QdBpdwB8JbRv1S8jpJLODZU=;
        b=itG8PKOAKIn/0//ZIZx1gsRCz0rPScDPzbZnYOrXPoECfPSYDqV1+r9ENGnyhWEA4l
         DqyZr+hE1qS9Gx7pNWs/mpSJYTXxcuUAp1brmqcWV4VNQliisrAEoImA4WQ5Fbb+sX+7
         3LAgIcIu1UzGoF3RjTxLu3DOV33K8yrv/d1PacQCOdadzx2ymbc5jthJCcx4U7IBWMA4
         1hhxZkyVhp32HZUQlfUzg5nbUvLb4WPRXG3M7sgaa4faUZ1Zb1jSX5j2GEHjI9uvVYMS
         vLm5bQ083eBULm+qXkdUdwchYGftIzAlh/j0EldX0yBILon4EeWjyQ2y07OLAm2vReXx
         XmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783538952; x=1784143752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=esUPZMaeDhSEKuB3vyh8QdBpdwB8JbRv1S8jpJLODZU=;
        b=OyqzuSfLl+Or4srMXLdR9DJw22PthaFn1OGwaX6oUFWbomjTRqc4w5T9t4qKQ0DyaC
         tVgbLDxuBphJXVHeSKax+WRZf4Do8qG1OxHxVYq5ebm5enr0uhvVxlqEyYl4F4d6f8Py
         HdGb33cFLDPEVH+AknKmFuVUYVTp/G07luJUsBhWclDpGTJGblC4kNKNdrQ5TGSrWSRU
         RkyRLIzpSmqRL2OjsNBRU1uOq+hmD33He/AeMCKpHOz5qp+K8Yr3hssuAzCpTgmy41Pw
         3QpVv30P3ynHv9J19LmOM17c7vMRlpC36QyvP8ADC+In9BAS6upCULUvTC0+i6p/NDKZ
         VEIA==
X-Gm-Message-State: AOJu0YyPn3io/x8ZebF1NHGOI3FkSe4WOnwZOVclWkvZvIWuVCeQxNhH
	GbP5cT4tD99sSTyl1KfXRjlEJzNBg/IETx2ersSvz+k6mVOwrB1iP6Jt7CYJPteotMwM+LdMisN
	BFEGdIcMsAU3ZoQ1GmcvgQfEv3WLFCGls5w==
X-Gm-Gg: AfdE7cmtJIncvEDhFN/sDpvA/jj6SrpYEGPKxHL9twZ+zEod9Vu5Y/BsBs69SwexAbb
	uOkHOHuQUkP2CWhWaA6cdu/K5gIB4OoqZI8EkC0ltIxfURwo9Lt8qsE1rCNGodYPq48Djv0u/Q1
	O1qABVLwou1LCQ+Ox0RJDWC/45wRDe4GjmofDiRCmTjxX9IVWJRtl1CS0rtOyLETH3G4iqeVcSE
	MSrLKlNsC/ba0mmNBirgVWgeafyF0YYW37qLX10YNvcIWjZOUJzuF1ucfJtkllg6ToQbA==
X-Received: by 2002:a05:690e:4803:b0:667:648a:d05d with SMTP id
 956f58d0204a3-6679f0b6cb9mr2240010d50.39.1783538951867; Wed, 08 Jul 2026
 12:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
 <20260707-dd-maint-2-v6-15-381f3edb0045@gmail.com> <20260708022913.E3D9A1F000E9@smtp.kernel.org>
In-Reply-To: <20260708022913.E3D9A1F000E9@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Wed, 8 Jul 2026 13:28:46 -0600
X-Gm-Features: AVVi8CcGWf-yvZRaz7uKpbWe3R_UDgHW5F3UfrE6h9rIgLwMf_mAYfqNisNfPwY
Message-ID: <CAJfuBxykm2wyG+UOvYqjO_uJBuo52ArGApHn2nmgRu4i+WwccA@mail.gmail.com>
Subject: Re: [PATCH v6 15/24] dyndbg: refactor param_set_dyndbg_classes and below
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The concern regarding old_bits in param_set_dyndbg_module_classes()
appears to be a false positive based on a misunderstanding of the
initialization order.

This is a sysfs parameter callback. By the time it is invoked, the
module has already been probed and ddebug_sync_classbits has updated
the module's pr-debugs to match the current parameter value.
Therefore, the global state (dcp->bits) correctly reflects the
module's state at the time of the callback. Using dcp->bits as
old_bits ensures we only toggle bits that have actually changed; using
0 as a baseline would result in redundant queries for settings already
synchronized during the probe sequence.

Thanks,
Jim
