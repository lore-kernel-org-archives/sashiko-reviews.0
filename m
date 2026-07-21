Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5942BEBB
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617112; cv=none; b=CSLTGTMrJiJYPyUlnrCdTSdb5sja1U9eaJvs8ZEKruffoaj2E9zwOU7EK+BlJaYaJkk/ZYCQ81F57nWUO7RYZr+v7q0A5c+Yaz/Wr4Z5qFSIxdBQvl38tSM+LYUCg73kcY6vcJy0WJCDzmFkEMYxSJVdbCBdiQpac7LnHh5n/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617112; c=relaxed/simple;
	bh=VsbWQj4kuVnYNaJML8F2xWAkTlWL3XaCg7fBblTWuEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=D9FgjFozFzcP6luVDRdsSiPPbJFWfdhKrxh3AF1nSPiHwz0dA/y+wkyJ1RHSOxQEvmpXsUVkaTNOBvZSRceslVJljDOM4hpjEsFEe3kdbgdpToUVxpAP81gBa2s9+tb6TdXT+mYSr9f56yrXEJbG1+CyiIAzRKwD5+hBito0wsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PwgsZu9J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PwgsZu9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784617110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsbWQj4kuVnYNaJML8F2xWAkTlWL3XaCg7fBblTWuEQ=;
	b=PwgsZu9JLhHXN5kyo8SOlEQnFjITxFugxOpMTBDVnzPrYkOv5zu0DXQpyz6N8ioKugnBv9
	tTDmYQgJuTIx5QSmu6hYO8xH5ck5Pg1eklytD7lsAA4VU9fHBsnrXAArnuikxlO6FuXdKH
	Ek8/SBnh9bcKsH/41eSAuFZMVAPh4nU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-wDTgatvZMtWRcBL7Feqf2Q-1; Tue,
 21 Jul 2026 02:58:28 -0400
X-MC-Unique: wDTgatvZMtWRcBL7Feqf2Q-1
X-Mimecast-MFC-AGG-ID: wDTgatvZMtWRcBL7Feqf2Q_1784617107
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A26C21802A91;
	Tue, 21 Jul 2026 06:58:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.59])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 362841800615;
	Tue, 21 Jul 2026 06:58:24 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: alex@shazbot.org
Cc: jtornosm@redhat.com,
	linux-pci@vger.kernel.org,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v12] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 21 Jul 2026 08:58:23 +0200
Message-ID: <20260721065823.201887-1-jtornosm@redhat.com>
In-Reply-To: <20260720125318.15508343@shazbot.org>
References: <20260720125318.15508343@shazbot.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: FdSTKA11m43KDXfivhYYw1W-6MY_Bx9vhJJIgPdnSNQ_1784617107
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Alex,

Thanks for the feedback.
I will send v13 addressing the improvements.

Best regards
Jose Ignacio

