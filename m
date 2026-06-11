Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EFE368D4F
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163513; cv=none; b=JA+biRlN6qDICpwf6RWQnD7qBaZbUo19ZhBgsxdXUZEOwES2mS8HeYCwmKDp359AwP4+0p6moxyuSDd4PPY+yczc6jIrKXfcbmqu+ufCaUAE/3sBdNbABvPIXAFfW6UYbzWrypZDjMyEZjFXcSD5lqzeszNvO8Qf8YZTMpagvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163513; c=relaxed/simple;
	bh=C5mX9v1e2554nFDQUJ1964OtjRu5W595wtAl6bEnsMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=NT4powex7jAKJJ5H2I4pPqBYtcyowqpOFAtbIsFZ909Bn96hifucWyXbpU/+1e8klxdtqKU7S7LOilb54eHc4+iX10x5LzHxYpNi0Vvfe1hRrKAaz8aFlLkxelLFZT4+i4RLdtPW07/LC8SJ0ZbgRjugaeIGTHnwpFmWddYTxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMH7sC6n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMH7sC6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781163510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1jvBu/gNshBYn/PmFXEmIdSqbgEPhIIYtTxZ9hA8YE=;
	b=gMH7sC6nmlYQpdYbxUoUCqZ634HpiYRM6/4V4BNxe0kAR7gUS7n1CJHfxd0Bx8akIj0vc3
	PQ6y0tV2VwzUbbOifhwQBS27TK3WwvtjRo4zvQ/8DMLAyMki65xmrhvb4/NpoqNWKsTlE+
	09rpYq0PKXBlgjzioLNlevmSc+dVMWA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-IOCK1u_-OGWmXZvbXrXNDg-1; Thu,
 11 Jun 2026 03:38:24 -0400
X-MC-Unique: IOCK1u_-OGWmXZvbXrXNDg-1
X-Mimecast-MFC-AGG-ID: IOCK1u_-OGWmXZvbXrXNDg_1781163503
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DB9E180AE04;
	Thu, 11 Jun 2026 07:38:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.63])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3267530001A1;
	Thu, 11 Jun 2026 07:38:20 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: rafael@kernel.org
Cc: helgaas@kernel.org,
	jtornosm@redhat.com,
	linux-pci@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v7 1/3] PCI: Add d3cold as general reset method
Date: Thu, 11 Jun 2026 09:38:19 +0200
Message-ID: <20260611073819.22865-1-jtornosm@redhat.com>
In-Reply-To: <CAJZ5v0jwK2tFfiP5fyOEupC8rLgCC-BwKy8qEuj5w6mphfZMhQ@mail.gmail.com>
References: <CAJZ5v0jwK2tFfiP5fyOEupC8rLgCC-BwKy8qEuj5w6mphfZMhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 7PXfJwXzkE6eOiacbrnP4mjsYzMzCtllR7nKejFhqK0_1781163503
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Bjorn and Rafael,

Thanks for the detailed feedback on the d3cold approach. Based on Alex's
suggestion and your concerns (ACPI portability, bridge issues, runtime PM
complications), I'm dropping the general d3cold infrastructure entirely.

I don't have enough hardware with _PR3 support for proper d3cold testing -
all my platforms for testing the Qualcomm devices lack _PR3 (desktop M.2 
adapters), and even less for testing all the scenarios you've mentioned
(bridges, multifunction devices, runtime PM interactions).

For v9 I'll simplify to a D3hot-only device-specific reset for the specific
Qualcomm devices (WCN6855, WCN7850, SDX62/SDX65) where testing shows D3hot
provides sufficient reset for VFIO reuse despite NoSoftRst+. This avoids the
d3cold concerns and focuses on the proven, tested solution.

Thanks

Best regards
Jose Ignacio

